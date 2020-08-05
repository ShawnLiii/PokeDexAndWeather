//
//  PokemonCollectionViewCell.swift
//  PokeDexAndWeather
//
//  Created by Shawn Li on 5/24/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import UIKit
import CollectionViewSlantedLayout

class PokemonCollectionViewCell: CollectionViewSlantedCell
{
    @IBOutlet weak var pokeImage: UIImageView!
    @IBOutlet weak var pokeNumLabel: UILabel!
    @IBOutlet weak var pokeNameLabel: UILabel!
    
}
