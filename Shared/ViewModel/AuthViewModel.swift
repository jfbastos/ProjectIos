//
//  AuthViewModel.swift
//  ProjectIos (iOS)
//
//  Created by user216021 on 10/10/23.
//

import Firebase
import UIKit
import AVFoundation

class AuthViewModel: NSObject, ObservableObject{
    @Published var didAuthenticateUser = false
    @Published var userSession : FirebaseAuth.User?
    private var tempCurrentUser : FirebaseAuth.User?
    
    override init(){
        userSession = Auth.auth().currentUser
        print("User logged : \(String(describing: Auth.auth().currentUser?.displayName))")
    }
    
    func login(withEmail email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Firebase login callback error : \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else {return}
            self.userSession = user
            
        }
    }
    
    func register(withEmail email: String, password : String, fullname : String, username : String){
        Auth.auth().createUser(withEmail: email, password: password){ result, error in
            if let error = error {
                print("DEBUG: Firebase callback error : \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
                    
            let data: [String : Any] = ["email" : email,
                                        "username": username,
                                        "fullname": fullname]
            
            Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                self.tempCurrentUser = user
                self.didAuthenticateUser = true
            }
        }
    }
    
    func uploadProfileImage(_ image: UIImage){
        guard let uid = tempCurrentUser?.uid else { return }
        ImageUploader.uploadImage(image: image) { imageUrl in
            Firestore.firestore().collection("users").document(uid).updateData(["profileImageUrl" : imageUrl]){ _ in
                
            }
        }
    }
    
    func signout(){
        self.userSession = nil
        try? Auth.auth().signOut()
    }
}
