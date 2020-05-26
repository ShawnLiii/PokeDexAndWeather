//
//  PhotoLibraryViewController.swift
//  TabBarTasks
//
//  Created by Shawn Li on 5/24/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import UIKit
import Gemini
import SVProgressHUD

class PhotoLibraryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource
{

    var photos = [Photo]()
    
    @IBOutlet weak var collectionView: GeminiCollectionView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        SVProgressHUD.setContainerView(self.view)
        fetchDataSource()
        setupAnimation()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        SVProgressHUD.show()
    }
    
    
    @IBAction func refreshBtnTapped(_ sender: UIBarButtonItem)
    {
        SVProgressHUD.show()
        fetchDataSource()
    }
    
    @IBAction func logoutTapped(_ sender: UIBarButtonItem)
    {
        UserAuthentication.logout(forWhichPage: self)
    }
    
    //MARK: - Fetch Data Source
    func fetchDataSource()
    {
        Service.shared.handleDataResponse(url: AppConstants.NetworkAPI.photoAPI)
        { (data) in
            do
            {
                let photoContainer = try JSONDecoder().decode(PhotoData.self, from: data)
                self.photos = photoContainer.items
                self.collectionView.reloadData()
                SVProgressHUD.dismiss()
            }
            catch
            {
                print(error)
            }
        }
    }
    
    // Configure Animation
    func setupAnimation()
    {
        collectionView.gemini
        .rollRotationAnimation()
        .degree(45)
        .rollEffect(.rollUp)
    }
    
    // MARK: - GeminiCollectionView Setting
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return photos.count
    }
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppConstants.StoryBoardID.photoCellID, for: indexPath) as! PhotoCollectionViewCell
    
        // Download image
        Service.shared.handleDataResponse(url: photos[indexPath.row].media.m)
        { (data) in
            cell.photoImage.image = UIImage(data: data)
        }

        //Animation
        self.collectionView.animateCell(cell)
        return cell
    }
   
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        //Animate
        self.collectionView.animateVisibleCells()
    }
   
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath)
    {
        if let cell = cell as? PhotoCollectionViewCell
        {
            self.collectionView.animateCell(cell)
        }
    }
}
