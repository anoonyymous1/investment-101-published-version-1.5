//
//  Login.swift
//  investment 101
//
//  Created by Celine Tsai on 9/4/24.
//

import SwiftUI
import Foundation

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showingCreateAccount = false
    @State private var showingError = false
    @State private var errorMessage = ""
    @State private var showLoginSuccess = false // State variable for controlling navigation
    @State private var isLoading = false // Track loading state

    var body: some View {
        NavigationStack {
            VStack {
                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                if isLoading {
                    // Display a loading indicator when isLoading is true
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                        .padding()
                } else {
                    // Show the login button when not loading
                    Button("Login") {
                        isLoading = true // Start loading
                        viewModel.login(username: username, password: password) { success in
                            isLoading = false // Stop loading regardless of the outcome
                            if success {
                                showLoginSuccess = true
                            } else {
                                errorMessage = "Login failed. Please try again."
                                showingError = true
                            }
                        }
                    }
                    .padding()
                }

                Button("Create new account") {
                    showingCreateAccount = true
                }
                .padding()
                .sheet(isPresented: $showingCreateAccount) {
                    CreateAccountView { success in
                        showingCreateAccount = !success
                        if success {
                            // Optionally reset login form or handle account creation success
                        }
                    }
                }
            }
            .navigationTitle("Login")
            .navigationDestination(isPresented: $showLoginSuccess) {
                LoginSuccessView()
            }
            .disabled(isLoading) // Optionally disable interaction when loading
            .alert(isPresented: $showingError) {
                Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
}


struct CreateAccountView: View {
    var completion: (Bool) -> Void
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var passwordConfirm: String = ""
    @State private var showingError = false
    @State private var errorMessage = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                SecureField("Confirm Password", text: $passwordConfirm)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button("Create new account") {
                    guard password == passwordConfirm else {
                        errorMessage = "Passwords do not match."
                        showingError = true
                        return
                    }
                    
                    // Call your API to create a new account
                    LoginViewModel().createAccount(username: username, password: password, passwordConfirm: passwordConfirm) { success in
                        if success {
                            completion(true)
                        } else {
                            errorMessage = "User already exists"
                            showingError = true
                        }
                    }
                }
                .padding()
                .alert(isPresented: $showingError) {
                    Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
                }
            }
            .navigationTitle("Create Account")
        }
    }
}


class LoginViewModel: ObservableObject {
    // URL of your login API endpoint
    private let loginURL = URL(string: "https://shibal.online/login")!
    // URL of your create account API endpoint
    private let createAccountURL = URL(string: "https://shibal.online/adduser")!
    
    // Function to log in a user
    func login(username: String, password: String, completion: @escaping (Bool) -> Void) {
        var components = URLComponents(url: loginURL, resolvingAgainstBaseURL: true)!
        components.queryItems = [
            URLQueryItem(name: "username", value: username),
            URLQueryItem(name: "password", value: password)
        ]
        
        guard let finalURL = components.url else {
            print("Invalid URL")
            DispatchQueue.main.async {
                completion(false)
            }
            return
        }
        
        var request = URLRequest(url: finalURL)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Login request error: \(error?.localizedDescription ?? "Unknown error")")
                DispatchQueue.main.async {
                    completion(false)
                }
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                let responseString = String(data: data, encoding: .utf8)?.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
                DispatchQueue.main.async {
                    completion(responseString == "true")
                }
            } else {
                DispatchQueue.main.async {
                    completion(false)
                }
            }
        }.resume()
    }

    
    // Function to create a new account
    // Function to create a new account
    func createAccount(username: String, password: String, passwordConfirm: String, completion: @escaping (Bool) -> Void) {
        var request = URLRequest(url: createAccountURL)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: Any] = ["username": username, "password1": password, "password2": passwordConfirm]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Create account request error: \(error?.localizedDescription ?? "Unknown error")")
                DispatchQueue.main.async {
                    completion(false)
                }
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                let responseString = String(data: data, encoding: .utf8)!
                DispatchQueue.main.async {
                    completion(responseString.contains("success"))
                }
            } else {
                DispatchQueue.main.async {
                    completion(false)
                }
            }
        }.resume()
    }

}



// Assuming you have LoginViewModel defined with login and createAccount methods that call your API
// and handle responses accordingly. You'll need to implement these methods based on your API's requirements.

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
