//
//  Pokemon.swift
//  PokeDexAndWeather
//
//  Created by Shawn Li on 5/24/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import UIKit

class Pokemon: Decodable
{
    var description: String = ""
    var height: Int = 0
    var id: Int = 0
    var imageUrl: URL?
    var name: String = ""
    var type: String = ""
    var weight: Int = 0
}
