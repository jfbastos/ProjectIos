//
//  SettingsHeaderView.swift
//  ProjectIos (iOS)
//
//  Created by user216021 on 10/5/23.
//

import SwiftUI

struct SettingsHeader: View {
    var body: some View {
        HStack() {
            Image(systemName: "person")
                .resizable()
                .scaledToFit()
                .frame(width: 64, height: 64)
                .clipShape(Circle())
                .padding(.leading)
            
            VStack(alignment : .leading, spacing : 4){
                Text("Jhonny Doe")
                    .font(.system(size : 18))
                
                Text("Avaliable")
                    .foregroundColor(.gray)
                    .font(.system(size : 14))
            }
            Spacer()
        }
        .frame(height : 80)
        .background(Color.white)
    }
}
