//
//  UserCell.swift
//  ProjectIos (iOS)
//
//  Created by user216021 on 10/9/23.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
    let user: User
    @EnvironmentObject var viewModel : AuthViewModel
    
    var body: some View {
        VStack {
            HStack{
                KFImage(URL(string : user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 4){
                   
                    Text(user.username)
                        .font(.system(size : 14, weight: .semibold))
                    
                    Text("Creating stuff to descontinue after")
                        .font(.system(size: 15))
                }
                .foregroundColor(.black)
                
                Spacer()
            }.padding(.horizontal)
        }
        .padding(.top)
    }
}
