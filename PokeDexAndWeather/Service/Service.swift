//
//  Service.swift
//  PokeDexAndWeather
//
//  Created by Shawn Li on 5/25/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import UIKit
import Alamofire

class Service
{
    static var `shared` = Service()
    
    private init(){}
    
    func handleDataResponse(url: URLConvertible, handler: @escaping (Data) -> ())
    {
        AF.request(url).response
        { (response) in
            if let data = response.data
            {
                handler(data)
            }
        }
        
    }
    
    func handleAnyResponse(url: URLConvertible, handler: @escaping (Any) -> ())
    {
        AF.request(url).responseJSON
        { (response) in
            if let json = response.value
            {
                handler(json)
            }
        }
    }
    
    func handleAnyResponse(url: URLConvertible, parameter: Parameters, handler: @escaping (Any) -> ())
    {
        AF.request(url, parameters: parameter).responseJSON
        { response in
            if let json = response.value
            {
                handler(json)
            }
        }
        
    }
    
}

