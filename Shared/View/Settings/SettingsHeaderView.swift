//
//  SettingsHeaderView.swift
//  ProjectIos (iOS)
//
//  Created by user216021 on 10/5/23.
//

import SwiftUI
import Kingfisher

struct SettingsHeader: View {
    private let user: User
    
    init(user : User){
        self.user = user
    }
    
    var body: some View {
        HStack() {
            KFImage(URL(string : user.profileImageUrl))
                .resizable()
                .scaledToFit()
                .frame(width: 64, height: 64)
                .clipShape(Circle())
                .padding(.leading)
            
            VStack(alignment : .leading, spacing : 4){
                Text(user.fullname)
                    .font(.system(size : 18))
                    .foregroundColor(.black)
                
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
