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
    @State private var showLoginSuccess = false
    @State private var isLoading = false

    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing: 0) {
                    Image("login_3")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: UIScreen.main.bounds.height / 2)
                        .clipped()
                    
                    
                    VStack(spacing: 0) {
                        Color.clear.frame(height: 50) // Add some invisible space combining image and fields sections

                        VStack {
                            Text("Login")
                                .font(.title)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading)
                                .padding()
                                

                            VStack {
                                TextField("Username", text: $username)
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .padding(.horizontal, 12)

                                SecureField("Password", text: $password)
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .padding(.horizontal, 12)

                                if isLoading {
                                    ProgressView()
                                        .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                                        .padding()
                                } else {
                                    Button(action: {
                                        isLoading = true
                                        viewModel.login(username: username, password: password) { success in
                                            isLoading = false
                                            if success {
                                                showLoginSuccess = true
                                            } else {
                                                errorMessage = "Login failed. Please try again."
                                                showingError = true
                                            }
                                        }
                                    }) {
                                        Text("Login")
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                            .padding()
                                            .frame(maxWidth: .infinity)
                                            .background(Color.blue)
                                            .cornerRadius(10)
                                    }
                                    .padding(.horizontal)
                                }

                                Button(action: {
                                    showingCreateAccount = true
                                }) {
                                    Text("Create Account")
                                        .foregroundColor(.white)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(Color.gray)
                                        .cornerRadius(10)
                                }
                                .padding(.horizontal)
                                .padding(.top, 8)

                                Spacer(minLength: 50)
                            }
                        }
                        .background(Color.white.opacity(0.95))
                        .cornerRadius(20, corners: [.topLeft, .topRight])
                        .padding(.top, -30)

                        Text("investmentapp v1.6")
                            .foregroundColor(.gray)
                            .font(.system(size: 12))
                            .padding(.bottom, 30)
                    }
                    .sheet(isPresented: $showingCreateAccount) {
                        CreateAccountView { success in
                            showingCreateAccount = !success
                        }
                    }
                }
                .edgesIgnoringSafeArea(.all)

                .navigationDestination(isPresented: $showLoginSuccess) {
                    LoginSuccessView()
                }
                .disabled(isLoading)
                .alert(isPresented: $showingError) {
                    Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
                }
            }
        }
    }
}


// Helper extension to allow corner rounding specific corners
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
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
                // Notch
                Capsule()
                    .frame(width: 40, height: 6)
                    .foregroundColor(Color.gray)
                    .padding(.top, 20)
                    .opacity(0.5)  // Adjust opacity to match your UI design.
                Text("Register")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .padding()
                Spacer()
                Image("login_4")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 350, height: 220)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Spacer()
                
                VStack(spacing: 8) {
                    TextField("Username", text: $username)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(.horizontal, 5)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(.horizontal, 5)
                    
                    SecureField("Confirm Password", text: $passwordConfirm)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(.horizontal, 5)
                    
                    Button(action: {
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
                    }) {
                        Text("Create Account")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.gray)
                            .cornerRadius(10)
                    }
                    .padding(.top)
                }
                .padding()
                
                Spacer()
            }
            .background(Color.white.edgesIgnoringSafeArea(.all))
            .alert(isPresented: $showingError) {
                Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
            }
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
