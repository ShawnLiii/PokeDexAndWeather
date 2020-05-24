//
//  SearchPageViewController.swift
//  TabBarTasks
//
//  Created by Shawn Li on 5/23/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import UIKit

class SearchPageViewController: UIViewController, UITextFieldDelegate
{

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var cityTF: UITextField!
    
    var currentCity = ""
    var delegate: SelectCityDelegate?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        cityLabel.text = currentCity
        cityTF.delegate = self
    }
      
    @IBAction func searchBtnTapped(_ sender: UIButton)
    {
        if let city = cityTF.text
        {
            delegate?.didChangeCity(city: city)
        }
        else
        {
            delegate?.didChangeCity(city: "Fort Collins")
        }
        
        navigationController?.popViewController(animated: true)
    }
  
    @IBAction func logoutBtnTapped(_ sender: UIBarButtonItem)
    {
        UserAuthentication.logout(forWhichPage: self)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        cityTF.resignFirstResponder()
    }
}
