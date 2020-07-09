//
//  ImagePickerManager.swift
//  Pain
//
//  Created by Leandro Ramos on 7/9/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import UIKit

class ImagePickerManager: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var picker = UIImagePickerController()
    var alert = UIAlertController(title: "Le Pain", message: "Choose the image from:", preferredStyle: .actionSheet)
    var viewController: UIViewController?
    var pickImageCallback: ((UIImage) -> ())?
    
    override init() {
        super.init()
    }
    
    func pickImage(_ viewController: UIViewController, _ callback: @escaping ((UIImage) -> ())) {
        pickImageCallback = callback
        self.viewController = viewController
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { (alertAction) in
            self.openCamera()
        }
        
        let galleryAction = UIAlertAction(title: "Gallery", style: .default) { (alertAction) in
            self.openGallery()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { (alertAction) in
            
        }
        
        picker.delegate = self
        alert.addAction(cameraAction)
        alert.addAction(galleryAction)
        alert.addAction(cancelAction)
        alert.popoverPresentationController?.sourceView = self.viewController!.view
        viewController.present(alert, animated: true, completion: nil)
    }
    
    func openCamera() {
        alert.dismiss(animated: true, completion: nil)
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
            self.viewController!.present(picker, animated: true, completion: nil)
        } else {
            let alertWarning = UIAlertView(title: "Warning", message: "you don't have a camera", delegate: nil, cancelButtonTitle: "Ok", otherButtonTitles: "")
            alertWarning.show()
        }
    }
    
    func openGallery() {
        alert.dismiss(animated: true, completion: nil)
        picker.sourceType = .photoLibrary
        self.viewController!.present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        pickImageCallback?(image)
    }
    
    @objc func imagePickerController(_ picker: UIImagePickerController, pickedImage: UIImage?) {
        
    }
    
}
