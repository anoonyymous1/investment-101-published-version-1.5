//
//  LoginModel.swift
//  investment 101
//
//  Created by Celine Tsai on 17/4/24.
//

import SwiftUI

enum UserDefaultsKeys {
    static let loginState = "LoginState"
}

func setLoginState(_ isLoggedIn: Bool) {
    UserDefaults.standard.set(isLoggedIn, forKey: UserDefaultsKeys.loginState)
}

func getLoginState() -> Bool {
    UserDefaults.standard.bool(forKey: UserDefaultsKeys.loginState)
}
