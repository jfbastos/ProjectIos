//
//  SettingsView.swift
//  ProjectIos (iOS)
//
//  Created by user216021 on 10/5/23.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack{
            Color(.systemGroupedBackground).ignoresSafeArea()
            VStack(spacing : 32){
                SettingsHeader()
                VStack(spacing : 1) {
                    ForEach((0...2), id: \.self){ _ in
                        SettingsCell()
                    }
                }
                
                Button(action: {
                    
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


