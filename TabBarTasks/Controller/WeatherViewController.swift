//
//  ViewController.swift
//  TabBarTasks
//
//  Created by Shawn Li on 5/23/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import UIKit
import CoreLocation
import SwiftyJSON
import SVProgressHUD

class WeatherViewController: UIViewController, SelectCityDelegate
{
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    
    let weather = Weather()
    
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        SVProgressHUD.setContainerView(self.view)
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        getUserlocation()
    }
  
    @IBAction func logoutBtnTapped(_ sender: UIBarButtonItem)
    {
        UserAuthentication.logout()
    }
    
    @IBAction func refreshBtnTapped(_ sender: UIButton)
    {
        getUserlocation()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "search"
        {
            let vc = segue.destination as! SearchPageViewController
            vc.currentCity = weather.city
            vc.delegate = self
        }
    }
    
    func didChangeCity(weatherJSON: JSON)
    {
        getWeather(weatherJSON: weatherJSON)
    }
    
    func getWeather(para: [String:String])
    {
        Service.shared.handleAnyResponse(url: AppConstants.NetworkAPI.weatherAPI, parameter: para)
        { (json) in
            let weather = JSON(json)
            self.createWeather(weatherJSON: weather)
            self.updateUI()
            SVProgressHUD.dismiss(withDelay: 0.2)
        }
    }
    
    func getWeather(weatherJSON: JSON)
    {
        createWeather(weatherJSON: weatherJSON)
        updateUI()
        SVProgressHUD.dismiss(withDelay: 0.2)
    }
    
    func createWeather(weatherJSON: JSON)
    {
        weather.city = weatherJSON["name"].stringValue
        weather.temp = Int(round(weatherJSON["main"]["temp"].doubleValue - 273.15))
        weather.condition = weatherJSON["weather"][0]["id"].intValue
    }
    
    func updateUI()
    {
        SVProgressHUD.show()
        cityLabel.text = weather.city
        tempLabel.text = "\(weather.temp)˚"
        weatherImage.image = UIImage(named: weather.icon)
    }
}

extension WeatherViewController: CLLocationManagerDelegate
{
    //MARK: - Location Manager Setting
      
    func getUserlocation()
    {
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        //Requests the one-time delivery of the user’s current location.
        locationManager.requestLocation()
        SVProgressHUD.show()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let lat = locations[0].coordinate.latitude
        let lon = locations[0].coordinate.longitude
        let paras = ["lat" : "\(lat)", "lon" : "\(lon)", "appid" : AppConstants.NetworkAPI.appid]
        
        getWeather(para: paras)
        SVProgressHUD.dismiss(withDelay: 0.2)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        cityLabel.text = "Fail to get Location"
        tempLabel.text = "N/A"
        weatherImage.image = UIImage(named: "tstorm1")
        SVProgressHUD.dismiss(withDelay: 0.2)
    }
}
