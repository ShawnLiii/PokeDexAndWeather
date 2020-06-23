//
//  UserAuthentication.swift
//  TabBarTasks
//
//  Created by Shawn Li on 5/23/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import UIKit
import LoginTextField

class UserAuthentication
{
    static func userNameTFSetup(userNameTF: inout LoginTextField, forWhichPage viewController: UIViewController)
    {
        userNameTF = LoginTextField.init(frame: CGRect(x: 10, y: 300, width: AppConstants.TextField.widthOfTF, height: AppConstants.TextField.heightOfTF))
        userNameTF.image = UIImage(systemName: "person")
        userNameTF.placeholder = AppConstants.TextField.userNamePH
        userNameTF.placeholderColor = .gray
        userNameTF.borderStyle = .roundedRect
        userNameTF.keyboardAppearance = .dark
        viewController.view.addSubview(userNameTF)
    }
    
    static func passwordTFSetup(passwordTF: inout LoginTextField,forWhichPage viewController: UIViewController)
    {
        passwordTF = LoginTextField.init(frame: CGRect(x: 10, y: 360, width: AppConstants.TextField.widthOfTF, height: AppConstants.TextField.heightOfTF))
        passwordTF.image = UIImage(systemName: "lock")
        passwordTF.placeholder = AppConstants.TextField.passwordPH
        passwordTF.placeholderColor = .gray
        passwordTF.borderStyle = .roundedRect
        passwordTF.keyboardAppearance = .dark
        passwordTF.isSecureTextEntry = true
        passwordTF.showPasswordApperanceButton = true
        viewController.view.addSubview(passwordTF)
    }
    
    static func logout()
    {
        UserDefaults.standard.set(false, forKey: AppConstants.UserInfo.loginStatusKey)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if let navCtrl = storyboard.instantiateInitialViewController()
        {
            let window = UIApplication.shared.windows.first
            window?.rootViewController = navCtrl
            window?.makeKeyAndVisible()
        }
    }
}
