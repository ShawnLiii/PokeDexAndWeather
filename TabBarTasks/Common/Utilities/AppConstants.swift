//
//  AppConstants.swift
//  TabBarTasks
//
//  Created by Shawn Li on 5/23/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import UIKit

struct AppConstants
{
    struct NetworkAPI
    {
        static let appid = "cdc67b29c6b83bab0fb228af5863d7d5"
        static let weatherAPI = "https://api.openweathermap.org/data/2.5/weather"
        static let pokemonAPI = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
        static let photoAPI = "https://www.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1"
    }
    
    struct TextField
    {
        static let widthOfTF: Int = Int(UIScreen.main.bounds.width - 20)
        static let heightOfTF: Int = 50
        static let userNamePH = "User Name. try: lightowlgg"
        static let passwordPH = "Password try: topikachu"
    }
    
    struct StoryBoardID
    {
        static let loginPageID = "LoginViewController"
        static let registerPageID = "RegisterViewController"
        static let tabBarControllerID = "TabBarController"
        static let pokeDexPageID = "PokemonCollectionViewController"
        static let weatherPageID = "WeatherViewController"
        static let collectionViewCellID = "pokemon"
        static let detailPageSegueID = "detail"
        static let photoLibPageID = "PhotoLibraryViewController"
        static let photoCellID = "photo"
        static let navControllerID = "LoginNavigationController"
    }
    
    struct UserInfo
    {
        static let loginStatusKey = "isLogin"
    }
    
    
}
