//
//  ViewController.swift
//  TabBarTasks
//
//  Created by Shawn Li on 5/23/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
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
        getUserlocation()
    }

    override func viewDidAppear(_ animated: Bool)
    {
        locationManager.requestWhenInUseAuthorization()
    }
    
    @IBAction func logoutBtnTapped(_ sender: UIBarButtonItem)
    {
        UserAuthentication.logout(forWhichPage: self)
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
    
    func didChangeCity(city: String)
    {
        let paras = ["q" : city, "appid" : AppConstants.NetworkAPI.appid]
        getWeather(para: paras)
    }
    
    func getWeather(para: [String:String])
    {
        AF.request(AppConstants.NetworkAPI.weatherAPI, parameters: para).responseJSON
        { response in
            if let json = response.value
            {
                let weather = JSON(json)
                self.createWeather(weatherJSON: weather)
                self.updateUI()
                SVProgressHUD.dismiss()
            }
        }
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
        print(error)
        cityLabel.text = "Fail to get Location"
    }
}