//
//  ChatCell.swift
//  ProjectIos (iOS)
//
//  Created by user216021 on 10/9/23.
//

import SwiftUI

struct ChatCell: View {
    let viewModel: MessageViewModel
    
    var body: some View {
        VStack {
            HStack{
                Image("Android_robot.svg")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 4){
                    Text("Android")
                        .font(.system(size : 14, weight: .semibold))
                    
                    Text(viewModel.message.text)
                        .font(.system(size: 15))
                }
                .foregroundColor(.black)
                
                Spacer()
            }.padding(.horizontal)
            
            Divider()
        }
        .padding(.top)
    }
}

