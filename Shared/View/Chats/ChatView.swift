//
//  ChatView.swift
//  ProjectIos (iOS)
//
//  Created by user216021 on 10/5/23.
//

import SwiftUI

struct ChatView: View {
    @State var messageText : String = ""
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
                        MessageView(viewModel: MessageViewModel(message))
                    }
                }
            }
            Rectangle()
                .foregroundColor(Color(.separator))
                .frame(width: UIScreen.main.bounds.width, height: 0.75)
            
            HStack{
                TextField("Message...", text: $messageText)
                    .textFieldStyle(PlainTextFieldStyle())
                    .font(.body)
                    .frame(minHeight: 30)
                
                Button(action: {
                    Task{
                        await viewModel.sendMessage(messageText)
                        messageText = ""
                    }
                }, label:{
                    Text("Send")
                        .bold()
                        .foregroundColor(.black)
                })
            }
            .padding(.bottom, 8)
            .padding(.horizontal)
            //CustomInputView(text: $messageText, action: sendMessage)
            
        }
        .navigationTitle(user.fullname)
        .navigationBarTitleDisplayMode(.inline)
        .padding(.vertical)
    }
}
