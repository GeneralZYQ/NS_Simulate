//
//  LoginManager.swift
//  NS_Simulate
//
//  Created by yuanqing zhang on 02/03/2023.
//

import Foundation

class LoginManager : ObservableObject {
    
    private static var sharedLoginManager: LoginManager = {
        let loginManager = LoginManager(userID: "", loginStatus: false)
        
        return loginManager
    }()

    @Published var userID : String
    @Published var loginStatus: Bool = true
    
    private init(userID: String, loginStatus: Bool) {
        self.userID = userID
        self.loginStatus = loginStatus
    }
    
    class func shared() -> LoginManager {
        return sharedLoginManager
    }
}
