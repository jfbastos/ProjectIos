//
//  ChatCell.swift
//  ProjectIos (iOS)
//
//  Created by user216021 on 10/9/23.
//

import SwiftUI
import Kingfisher

struct ChatCell: View {
    @ObservedObject var viewModel: ChatCellViewModel
    @State var user : User
    
    var body: some View {
        VStack {
            HStack {
                KFImage(viewModel.chatProfilePartnetUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                
                // message info
                VStack(alignment: .leading, spacing: 4) {
                    Text(viewModel.fullname)
                        .font(.system(size: 14, weight: .semibold))
                    
                    HStack(alignment: .bottom){
                        Text(viewModel.message.text)
                            .font(.system(size: 15))
                        
                        Spacer()
                        Text(viewModel.message.timestamp.dateValue(), style: .time)
                            .font(.system(size: 12))
                    }
                }.foregroundColor(.black)
                
                Spacer()
                
            }
            .padding(.horizontal)
            
            Divider()
        }
        .padding(.top)
    }
}

