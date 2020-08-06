//
//  ProfileChangePasswordViewController.swift
//  PokeDexAndWeather
//
//  Created by Shawn Li on 8/5/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import UIKit

class ProfileChangePasswordViewController: UIViewController, UITextFieldDelegate {


    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNamelbl: UILabel!
    @IBOutlet weak var newPasswordTF: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func saveBtnTapped(_ sender: UIBarButtonItem)
    {
        if let newPassword = newPasswordTF.text, !newPassword.isEmpty
        {
            UserDefaults.standard.setValue(newPassword, forKey: "password")
            AlertManager.alert(forWhichPage: self, alertType: .passwordHasChanged)
            {
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
        else
        {
            AlertManager.alert(forWhichPage: self, alertType: .userAuthenticationEmpty, handler: nil)
        }
        
    }
    
    func setupUI()
    {
        newPasswordTF.delegate = self
        
        if let userName = UserDefaults.standard.value(forKey: "username") as? String, let imageData = UserDefaults.standard.value(forKey: "image") as? Data
        {
            userNamelbl.text = userName
            profileImageView.image = UIImage(data: imageData)
        }
        else
        {
            userNamelbl.text = "LightOwlGG"
            profileImageView.image = UIImage(systemName: "person.crop.circle.fill")
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        newPasswordTF.resignFirstResponder()
    }
    
}
