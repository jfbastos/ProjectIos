//
//  ChatView.swift
//  ProjectIos (iOS)
//
//  Created by user216021 on 10/5/23.
//

import SwiftUI

struct ChatView: View {
    @State private var messageText = ""
    @ObservedObject var viewModel: ChatViewModel
    private let user: User
    
    init(user : User){
        self.user = user
        self.viewModel = ChatViewModel(user : user)
    }
    
    var body: some View {
        VStack {
            ScrollView{
                VStack(alignment : .leading, spacing : 12){
                    ForEach(viewModel.messages) { message in
                        MessageView(viewModel: MessageViewModel(message : message))
                    }
                }
            }
            
            CustomInputView(text: $messageText, action: sendMessage)
        }
        .navigationTitle(user.fullname)
        .navigationBarTitleDisplayMode(.inline)
        .padding(.vertical)
    }
    
    func sendMessage(){
        viewModel.sendMessage(messageText)
        messageText = ""
    }
}
