//
//  MessageView.swift
//  ProjectIos (iOS)
//
//  Created by user216021 on 10/10/23.
//

import SwiftUI

struct MessageView: View {
    var isFromCurrentUser : Bool
    var messageText: String
    var body: some View {
        HStack{
            if isFromCurrentUser{
                Spacer()
                
                Text(messageText)
                    .padding(12)
                    .background(Color.blue)
                    .font(.system(size : 15))
                    .clipShape(ChatBubble(isFromCurrentUser: false))
                    .foregroundColor(.white)
                    .padding(.leading, 100)
                    .padding(.horizontal)
                
            }else{
                HStack(alignment : .bottom){
                    Image("Android_robot.svg")
                        .resizable()
                        .scaledToFill()
                        .frame(width : 32, height: 32)
                        .clipShape(Circle())
                    
                    Text(messageText)
                        .padding(12)
                        .background(Color(.systemGray5))
                        .font(.system(size : 15))
                        .clipShape(ChatBubble(isFromCurrentUser: false))
                        .foregroundColor(.black)
                }
                .padding(.horizontal)
                .padding(.trailing, 80)
                
                Spacer()
            }
        }
    }
}
