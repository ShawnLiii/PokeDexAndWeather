//
//  AppDelegate.swift
//  TabBarTasks
//
//  Created by Shawn Li on 5/23/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol SelectCityDelegate
{
    func didChangeCity(weatherJSON: JSON)
}
