//
//  PokemonDetailViewController.swift
//  TabBarTasks
//
//  Created by Shawn Li on 5/24/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController
{
    var pokeimage: UIImage?
    var detail: String?
    var height: Int?
    var id: Int?
    var name: String?
    var type: String?
    var weight: Int?
    
    @IBOutlet weak var pokemonIV: UIImageView!
    @IBOutlet weak var pokemonIDLab: UILabel!
    @IBOutlet weak var pokemonNameLab: UILabel!
    @IBOutlet weak var pokemonTypeLab: UILabel!
    @IBOutlet weak var pokemonHLab: UILabel!
    @IBOutlet weak var pokemonWLab: UILabel!
    @IBOutlet weak var pokemonDetailTV: UITextView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func logoutBtnTapped(_ sender: UIBarButtonItem)
    {
        UserAuthentication.logout()
    }
    
    func setupUI()
    {
        pokemonIV.image = pokeimage
        pokemonIDLab.text = String(id!)
        
        if let pokeHeight = height
        {
            pokemonHLab.text = String(pokeHeight)
        }
        else
        {
            pokemonHLab.text = "Unknown"
        }
        
        if let pokeWeight = weight
        {
            pokemonWLab.text = String(pokeWeight)
        }
        else
        {
            pokemonWLab.text = "Unknown"
        }
        
        pokemonTypeLab.text = type
        pokemonNameLab.text = name
        pokemonDetailTV.text = detail
        
    }
}
