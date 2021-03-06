//
//  RegisterViewController.swift
//  PokeDexAndWeather
//
//  Created by Shawn Li on 5/23/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import UIKit
import LoginTextField
import LGButton

class RegisterViewController: UIViewController, UITextFieldDelegate
{

    var userNameTF = LoginTextField()
    var passwordTF = LoginTextField()
    var loginDelegate: LoginDelegate?
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func registerBtnTapped(_ sender: LGButton)
    {
        if let username = userNameTF.text, let password = passwordTF.text, !username.isEmpty, !password.isEmpty
        {
            if isKeyPresentInUserDefaults(value: username)
            {
                AlertManager.alert(forWhichPage: self, alertType: .userExist, handler: nil)
            }
            else
            {
                UserDefaults.standard.set(username, forKey: "username")
                UserDefaults.standard.set(password, forKey: "password")
                loginDelegate?.fillUserName(username: username)
                AlertManager.alert(forWhichPage: self, alertType: .registerSuccess)
                {
                    self.navigationController?.popToRootViewController(animated: true)
                }
                
            }
        }
        else
        {
            AlertManager.alert(forWhichPage: self, alertType: .userAuthenticationEmpty, handler: nil)
        }
    }
    
    func setupUI()
    {
       // User Name
        UserAuthentication.userNameTFSetup(userNameTF: &userNameTF, forWhichPage: self)
        //Password
        UserAuthentication.passwordTFSetup(passwordTF: &passwordTF, forWhichPage: self)
        userNameTF.delegate = self
        passwordTF.delegate = self
        
    }
    
    func isKeyPresentInUserDefaults(value: String) -> Bool
    {
        guard let username = UserDefaults.standard.value(forKey: "username") as? String else { return false }
        
        return username == value
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        userNameTF.resignFirstResponder()
        passwordTF.resignFirstResponder()
        return true
    }
    
}
