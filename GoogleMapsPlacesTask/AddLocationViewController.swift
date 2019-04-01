//
//  AddLocationViewController.swift
//  GoogleMapsPlacesTask
//
//  Created by Nikhil Patil on 30/03/19.
//  Copyright © 2019 Nikhil Patil. All rights reserved.
//

import UIKit

class AddLocationViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var addImage: UIImageView!
    
    var picker:UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageGesture()
        
        // Do any additional setup after loading the view.
    }
    
    func imageGesture()
    {
        let tap = UITapGestureRecognizer(target: self, action: #selector(onImageTap(sender:)))
        addImage.addGestureRecognizer(tap)
        addImage.isUserInteractionEnabled = true
    }
    
    
    @objc func onImageTap(sender:UITapGestureRecognizer)
    {
        if(sender.view as? UIImageView) != nil
        {
            print("Gesture tapped")
            actionSheet()
        }
        
    }
    
    func addImagePicker()
    {
        picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        
        self.present(picker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImg = info[UIImagePickerController.InfoKey.editedImage]
        {
            addImage.image = pickedImg as? UIImage
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func actionSheet()
    {
        let actionSheet = UIAlertController(title: "「 Add Image 」", message: "Choose From", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { (action) in
            self.addImagePicker()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            
        }))
        self.present(actionSheet, animated: true, completion: nil)
    }
}
