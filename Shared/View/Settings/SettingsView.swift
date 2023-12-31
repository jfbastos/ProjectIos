//
//  SettingsView.swift
//  ProjectIos (iOS)
//
//  Created by user216021 on 10/5/23.
//

import SwiftUI

struct SettingsView: View {
//    private let user: User
//
//    init(user : User){
//        self.user = user
//    }
    
    @EnvironmentObject var viewModel : AuthViewModel
    
    var body: some View {
        ZStack{
            Color(.systemGroupedBackground).ignoresSafeArea()
            VStack(spacing : 32){

                if let user = viewModel.currentUser{
                    NavigationLink(destination: EditProfileView()){
                        SettingsHeader(user : user)
                    }
                }                
                
                Button(action: {
                    viewModel.signout()
                    AuthViewModel.shared.userSession = nil
                }, label: {
                    Text("Log out")
                        .foregroundColor(.red)
                        .font(.system(size : 16, weight: .semibold))
                        .frame(width : UIScreen.main.bounds.width, height : 50)
                        .background(Color.white)
                })
                
                Spacer()
            }
        }
        .onAppear{
            viewModel.fetchUser()
        }
        
    }
}



