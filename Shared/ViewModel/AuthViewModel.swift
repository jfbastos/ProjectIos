//
//  AuthViewModel.swift
//  ProjectIos (iOS)
//
//  Created by user216021 on 10/10/23.
//

import Firebase
import UIKit

class AuthViewModel: NSObject, ObservableObject{
    @Published var didAuthenticateUser = false
    @Published var userSession : FirebaseAuth.User?
    private var tempCurrentUser : FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var isLoggedIn = false
    @Published var loginErrorOcurred = false
    @Published var resetPasswordError : String?
    
    static var shared : AuthViewModel = AuthViewModel()
    
    override init(){
        super.init()
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func login(withEmail email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Firebase login callback error : \(error.localizedDescription)")
                self.loginErrorOcurred = true
                return
            }
            
            guard let user = result?.user else {return}
            self.userSession = user
            self.fetchUser()
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
                                        "fullname": fullname,
                                        "status": "Available"]
            
            COLLECTION_USERS.document(user.uid).setData(data) { _ in
                self.tempCurrentUser = user
                self.didAuthenticateUser = true
            }
        }
    }
    
    func uploadProfileImage(_ image: UIImage){
        guard let uid = tempCurrentUser?.uid else { return }
        ImageUploader.uploadImage(image: image) { imageUrl in
            COLLECTION_USERS.document(uid).updateData(["profileImageUrl" : imageUrl]){ _ in
                self.userSession = self.tempCurrentUser
                self.isLoggedIn = true
            }
        }
    }
    
    func updateProfileImage(_ image: UIImage){
        guard let uid = userSession?.uid else { return }
        ImageUploader.uploadImage(image: image) { imageUrl in
            COLLECTION_USERS.document(uid).updateData(["profileImageUrl" : imageUrl]){ _ in
               
            }
        }
    }
    
    func updateStatus(status : String){
        guard let uid = userSession?.uid else {return}
        COLLECTION_USERS.document(uid).updateData(["status" : status]){ _ in
           
        }
    }
    
    func forgotPassword(email :String){
        
        Auth.auth().sendPasswordReset(withEmail: email){ error in
            print("DEBUG: Reset email sended to \(email)")
            if let error = error {
                print("DEBUG: Firebase callback error : \(error.localizedDescription)")
                self.resetPasswordError = error.localizedDescription
                return
            }
            
            self.resetPasswordError = nil
        }
    }
    
    func signout(){
        self.userSession = nil
        self.isLoggedIn = false
        self.didAuthenticateUser = false
        self.currentUser = nil
        self.tempCurrentUser = nil
        try? Auth.auth().signOut()
    }
    
    func fetchUser(){
        self.userSession = Auth.auth().currentUser
        guard let uid = self.userSession?.uid else {return}
        COLLECTION_USERS.document(uid).getDocument{ snapshot, _ in
            guard let user = try? snapshot?.data(as: User.self) else {return}
            self.isLoggedIn = true
            self.loginErrorOcurred = false
            self.currentUser = user
        }
    }
}
