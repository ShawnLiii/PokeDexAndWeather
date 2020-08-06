//
//  ProfileViewController.swift
//  PokeDexAndWeather
//
//  Created by Shawn Li on 8/5/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import UIKit


class ProfileViewController: UIViewController {
    
    let imagePickerCtrl = UIImagePickerController()
    
    
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var profilePhotoImageView: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupUI()
        setupGestureForImageView()
    }
    
    @IBAction func logoutBtnTapped(_ sender: UIButton)
    {
        UserAuthentication.logout()
    }
    
    func setupGestureForImageView()
    {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        profilePhotoImageView.isUserInteractionEnabled = true
        profilePhotoImageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func imageTapped()
    {
        setupImagePicker()
    }
    
    func setupUI()
    {
        userNameLbl.text = UserDefaults.standard.value(forKey: "username") as? String
        if let imagedata = UserDefaults.standard.value(forKey: "image") as? Data
        {
            profilePhotoImageView.image = UIImage(data: imagedata)
        }
        else
        {
            profilePhotoImageView.image = UIImage(systemName: "person.crop.circle.fill")
        }
    }
}
//MARK: - Image Picker Controll Implementation
extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    
    func setupImagePicker()
    {
        imagePickerCtrl.allowsEditing = true
        imagePickerCtrl.delegate = self
        imagePickerCtrl.sourceType = .photoLibrary
        present(imagePickerCtrl, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        guard let image = info[.editedImage] as? UIImage else { return }
        profilePhotoImageView.contentMode = .scaleAspectFill
        profilePhotoImageView.image = image
        UserDefaults.standard.setValue(image.pngData(), forKey: "image")
        imagePickerCtrl.delegate = nil
        dismiss(animated: true, completion: nil)
    }
}



