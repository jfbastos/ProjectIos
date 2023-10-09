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
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            
            NavigationLink(destination: ChatView(), isActive: $showChatView, label: {})
            
            ScrollView {
                VStack(alignment : .leading){
                    ForEach((0...10), id : \.self) { _ in
                        ChatCell()
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
                    NewMessageView(showChatView: $showChatView)
                })
        }
    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView()
    }
}
