//
//  ProjectIosApp.swift
//  Shared
//
//  Created by user216021 on 10/2/23.
//

import SwiftUI
import Firebase

@main
struct ProjectIosApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
           ContentView().environmentObject(AuthViewModel())
        }
    }
}
