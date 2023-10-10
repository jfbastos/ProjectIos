//
//  AuthViewModel.swift
//  ProjectIos (iOS)
//
//  Created by user216021 on 10/10/23.
//

import Firebase

class AuthViewModel: NSObject, ObservableObject{
    func login(){
        
    }
    
    func register(withEmail email: String, password : String, fullname : String, username : String){
        Auth.auth().createUser(withEmail: email, password: password){ result, error in
            if let error = error {
                print("DEBUG: Firebase callback error : \(error.localizedDescription)")
                return
            }
            
            print("DEBUG: Successfully registed user \(username)")
        }
    }
    
    func uploadProfileImage(){
        
    }
    
    func signout(){
        
    }
}
