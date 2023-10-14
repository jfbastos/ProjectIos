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
    @State var selectedUser: User?
    @ObservedObject var viewModel = ConversationsViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            
            if viewModel.recentMessages.count == 0{
                ScrollView{
                    VStack{
                        Text("No new messages yet.")
                            .font(.system(size: 16, weight: .semibold))
                            .frame(width: UIScreen.main.bounds.width, alignment: .center)
                    }
                }
            }else{
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(viewModel.recentMessages) { message in
                            ChatCell(viewModel: ChatCellViewModel(message))
                        }
                    }
                }
            }
        }
        .onAppear{viewModel.fetchRecentMessages()}
    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView()
    }
}
