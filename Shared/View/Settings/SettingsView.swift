//
//  SettingsView.swift
//  ProjectIos (iOS)
//
//  Created by user216021 on 10/5/23.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var viewModel : AuthViewModel
    
    var body: some View {
        ZStack{
            Color(.systemGroupedBackground).ignoresSafeArea()
            VStack(spacing : 32){
                NavigationLink(destination: EditProfileView(), label: {SettingsHeader()})
                
                
                VStack(spacing : 1) {
                    ForEach(SettingsCellViewModel.allCases, id: \.self){ viewModel in
                        SettingsCell(viewModel : viewModel)
                    }
                }
                
                Button(action: {
                    viewModel.signout()
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
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}


