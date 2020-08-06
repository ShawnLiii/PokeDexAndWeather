//
//  AlertManager.swift
//  PokeDexAndWeather
//
//  Created by Shawn Li on 5/24/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import UIKit
import PMAlertController

class AlertManager
{
   enum AlertType: String
    {
        case userAuthenticationFailed = "User Name or Password is Incorrect!"
        case userAuthenticationEmpty = "User Name or Password is Empty"
        case userExist = "User Name Already Exist"
        case registerSuccess = "Register Successful!"
        case passwordHasChanged = "Password has been changed!"
        case cityNameNotExist = "The City Can't be Found"
        case cityNameEmpty = "City Name Can't be Empty"
    }
    
    static func alert(forWhichPage viewController: UIViewController, alertType: AlertType, handler: (() -> Void)?)
    {
        var message = String()
        var title = "Warning!"
        var imageName = "warning"
        
        switch alertType
        {
        case .userAuthenticationFailed:
            message = AlertType.userAuthenticationFailed.rawValue
        case .userAuthenticationEmpty:
            message = AlertType.userAuthenticationEmpty.rawValue
        case .userExist:
            message = AlertType.userExist.rawValue
        case .registerSuccess:
            message = AlertType.registerSuccess.rawValue
            title = "Great!"
            imageName = "panda"
        case .passwordHasChanged:
            message = AlertType.passwordHasChanged.rawValue
            title = "Great!"
            imageName = "panda"
        case .cityNameNotExist:
            message = AlertType.cityNameNotExist.rawValue
        case .cityNameEmpty:
            message = AlertType.cityNameEmpty.rawValue
        }
        
        let alterController = PMAlertController(title: title, description: message, image: UIImage(named: imageName), style: .alert)
        
        var alertAction = PMAlertAction(title: "OK", style: .default)
        
        if alertType == .registerSuccess || alertType == .passwordHasChanged
        {
            alertAction = PMAlertAction(title: "Mua", style: .default, action:
            {
                handler!()
            })
        }
        
        alterController.addAction(alertAction)
        viewController.present(alterController, animated: true, completion: nil)
        
    }
}
