//
//  PokemonDetailViewController.swift
//  TabBarTasks
//
//  Created by Shawn Li on 5/24/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import UIKit
import LTMorphingLabel

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
    @IBOutlet weak var pokemonIDLab: LTMorphingLabel!
    @IBOutlet weak var pokemonNameLab: LTMorphingLabel!
    @IBOutlet weak var pokemonTypeLab: LTMorphingLabel!
    @IBOutlet weak var pokemonHLab: LTMorphingLabel!
    @IBOutlet weak var pokemonWLab: LTMorphingLabel!
    @IBOutlet weak var pokemonDetailTV: UITextView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func logoutBtnTapped(_ sender: UIBarButtonItem)
    {
        UserAuthentication.logout(forWhichPage: self)
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
        
        //Interact with label

//            self.pokemonIDLab.pause()
//            self.pokemonIDLab.updateProgress(progress: 0.3)
//
//            self.pokemonHLab.pause()
//            self.pokemonHLab.updateProgress(progress: 0.3)
//
//            self.pokemonNameLab.pause()
//            self.pokemonNameLab.updateProgress(progress: 0.3)
//
//            self.pokemonWLab.pause()
//            self.pokemonWLab.updateProgress(progress: 0.3)
//
//            self.pokemonTypeLab.pause()
//            self.pokemonTypeLab.updateProgress(progress: 0.3)

        
        
    }
}
