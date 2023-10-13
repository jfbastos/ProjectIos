//
//  ConversationView.swift
//  ProjectIos (iOS)
//
//  Created by user216021 on 10/5/23.
//

import SwiftUI

struct ConversationView: View {
    @State private var showNewMessageView = false
    @State private var showChatView = false
    @State var selectedUser : User?
    @ObservedObject var viewModel = ConversationsViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            
            if let user = selectedUser {
                NavigationLink(destination: ChatView(user : user), isActive: $showChatView, label: {})
            }
            
            ScrollView {
                VStack(alignment : .leading){
                    ForEach(viewModel.recentMessages) { message in
                        NavigationLink(destination : ChatView(user : MOCK_USER), label : {ChatCell(viewModel: MessageViewModel(message: message))})
                    }
                }
            }
            
            Button(action: {
                showNewMessageView.toggle()
            }, label: {
                Image(systemName: "square.and.pencil")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .padding()
            })
                .background(Color(.systemBlue))
                .foregroundColor(.white)
                .clipShape(Circle())
                .padding()
                .fullScreenCover(isPresented: $showNewMessageView, content: {
                    NewMessageView(showChatView: $showChatView, user: $selectedUser)
                })
        }
    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView()
    }
}
