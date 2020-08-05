//
//  SearchPageViewController.swift
//  PokeDexAndWeather
//
//  Created by Shawn Li on 5/23/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import UIKit
import SwiftyJSON

class SearchPageViewController: UIViewController, UITextFieldDelegate
{

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var cityTF: UITextField!
    
    var currentCity: String?
    var delegate: SelectCityDelegate?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        cityLabel.text = currentCity
        cityTF.delegate = self
    }
      
    @IBAction func searchBtnTapped(_ sender: UIButton)
    {
        if let city = cityTF.text, !city.isEmpty
        {
            let paras = ["q" : city, "appid" : AppConstants.NetworkAPI.appid]
            Service.shared.handleAnyResponse(url: AppConstants.NetworkAPI.weatherAPI, parameter: paras)
            { (json) in
                
                if JSON(json)["cod"].rawString() != "404"
                {
                    self.delegate?.didChangeCity(weatherJSON: JSON(json))
                    self.navigationController?.popViewController(animated: true)
                }
                else
                {
                    AlertManager.alert(forWhichPage: self, alertType: .cityNameNotExist, handler: nil)
                }
                
            }
        }
        else
        {
            AlertManager.alert(forWhichPage: self, alertType: .cityNameEmpty, handler: nil)
        }
        
    }
  
    @IBAction func logoutBtnTapped(_ sender: UIBarButtonItem)
    {
        UserAuthentication.logout()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        cityTF.resignFirstResponder()
    }
}
