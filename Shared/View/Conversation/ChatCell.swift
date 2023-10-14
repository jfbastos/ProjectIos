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
    @State var isChatSelected : Bool = false
    
    var body: some View {
        if let user = viewModel.message.user {
            Button(action: {
                isChatSelected.toggle()
            }, label: {
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
                            
                            Text(viewModel.message.text)
                                .font(.system(size: 15))
                        }.foregroundColor(.black)
                        
                        Spacer()
                        
                    }
                    .padding(.horizontal)
                    
                    Divider()
                }
                .padding(.top)
            })
            
            NavigationLink(destination: ChatView(user: user), isActive: $isChatSelected, label: {})
//
//            NavigationLink(destination: ChatView(user: user)) {
//
//            }.navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

