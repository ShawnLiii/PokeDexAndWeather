//
//  PokemonCollectionViewController.swift
//  TabBarTasks
//
//  Created by Shawn Li on 5/23/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import CollectionViewSlantedLayout
import ViewAnimator

class PokemonCollectionViewController: UICollectionViewController
{
    var pokemons = [Pokemon]()
    var index = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    @IBAction func logoutBtnTapped(_ sender: UIBarButtonItem)
    {
        UserAuthentication.logout(forWhichPage: self)
    }
    
    func setupUI()
    {
        let slantedSayout = CollectionViewSlantedLayout()
        collectionView.collectionViewLayout = slantedSayout
        fetchDataSource()
    }
    
    func fetchDataSource()
    {
        AF.request(AppConstants.NetworkAPI.pokemonAPI).responseJSON
            { (response) in
                if let json = response.value
                {
                    var pokemonJSON = JSON(json)
                    // Remove first nil object
                    pokemonJSON.arrayObject?.remove(at: 0)
                    self.createPokemonContainer(json: pokemonJSON)
                    self.collectionView.reloadData()
                }
        }
    }
    
    func createPokemonContainer(json: JSON)
    {
        for item in json
        {
            let pokemon = Pokemon()
            let pokeJSON = item.1
            pokemon.name = pokeJSON["name"].stringValue
            pokemon.id = pokeJSON["id"].intValue
            pokemon.description = pokeJSON["description"].stringValue
            pokemon.type = pokeJSON["type"].stringValue
            pokemon.imageUrl = pokeJSON["imageUrl"].url!
            pokemon.height = pokeJSON["height"].intValue
            pokemon.weight = pokeJSON["weight"].intValue
            pokemons.append(pokemon)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let vc = segue.destination as! PokemonDetailViewController
        let cell = sender as! PokemonCollectionViewCell
        index = collectionView.indexPath(for: cell)!.row
        let pokemon = pokemons[index]
        vc.pokeimage = cell.pokeImage.image
        vc.detail = pokemon.description
        vc.height = pokemon.height
        vc.id = pokemon.id
        vc.name = pokemon.name
        vc.type = pokemon.type
    }
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return pokemons.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppConstants.StoryBoardID.collectionViewCellID, for: indexPath) as! PokemonCollectionViewCell
        // Donwload Image
        AF.request(pokemons[indexPath.row].imageUrl!).response
        { (response) in
            if let data = response.data
            {
                cell.pokeImage.image = UIImage(data: data)
            }
        }
        
        cell.pokeNameLabel.text = pokemons[indexPath.row].name
        cell.pokeNumLabel.text = String(pokemons[indexPath.row].id)
        //Animation
        let zoomAnimation = AnimationType.zoom(scale: 0.2)
        let rotateAnimation = AnimationType.rotate(angle: CGFloat.pi/6)
        UIView.animate(views: [cell], animations: [zoomAnimation, rotateAnimation], duration: 1.5)
        return cell
    }

}
