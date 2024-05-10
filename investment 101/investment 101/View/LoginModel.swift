import Foundation

class LoginModel {

    private let userDefaults = UserDefaults.standard
    private let loginKey = "isLoggedIn"

    /// Saves that the user is logged in to UserDefaults.
    func setLoginTrue() {
        userDefaults.set(true, forKey: loginKey)
        userDefaults.synchronize()  // Ensures that the data is saved immediately
    }

    /// Saves that the user is logged out to UserDefaults.
    func setLoginFalse() {
        userDefaults.set(false, forKey: loginKey)
        userDefaults.synchronize()  // Ensures that the data is saved immediately
    }

    /// Returns the login status.
    /// - Returns: true if the user is marked as logged in, false otherwise.
    func getLoginStatus() -> Bool {
        return userDefaults.bool(forKey: loginKey)
    }
}
func loginUser() {
    // Presume authentication check has already passed here

    let loginModel = LoginModel()
    loginModel.setLoginTrue()

    // Proceed to the main part of your application
}

func logoutUser() {
    let loginModel = LoginModel()
    loginModel.setLoginFalse()

    // Return to login screen or perform other clean up
}

func checkIfUserIsLoggedIn() -> Bool {
    let loginModel = LoginModel()
    print(loginModel.getLoginStatus())
    return loginModel.getLoginStatus()
}
