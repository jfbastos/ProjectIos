//
//  NewMessageView.swift
//  ProjectIos (iOS)
//
//  Created by user216021 on 10/9/23.
//

import SwiftUI

struct NewMessageView: View {
    @State private var searchText = ""
    @State private var isUserSelected = false
    @State private var isEditing = false
    @State private var user : User?
    @ObservedObject var viewModel = NewMessageViewModel()
    
    var body: some View {
        VStack{
            ScrollView {
                SearchBar(text: $searchText, isEditing: $isEditing)
                    .onTapGesture {
                        isEditing.toggle()
                    }
                    .padding()
                
                VStack(alignment : .leading){
                    ForEach(viewModel.users) { user in
                        Button(action: {
                            self.user = user
                            isUserSelected.toggle()
                        }, label: {
                            UserCell(user : user)
                        })
                    }
                    
                    if let selectedUser = user{
                        NavigationLink(
                            destination: ChatView(user: selectedUser),
                            isActive: $isUserSelected,
                            label: { })
                    }
                    
                }
            }
        }
    }
}
