//
//  ImageUploader.swift
//  ProjectIos (iOS)
//
//  Created by user216021 on 10/11/23.
//

import Firebase
import UIKit
import FirebaseCoreInternal
import FirebaseStorage

struct ImageUploader{
    
    
    static func uploadImage(image : UIImage, completion: @escaping(String) -> Void){
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
              
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        ref.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("DEBUG: Failed to upload image with error \(error.localizedDescription)")
                return
            }
            
            ref.downloadURL{ url, _ in
                guard let imageUrl = url?.absoluteString else { return }
                completion(imageUrl)
            }
        }
        
    }
}
