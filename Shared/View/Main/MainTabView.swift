//
//  MainTabView.swift
//  ProjectIos (iOS)
//
//  Created by user216021 on 10/5/23.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex = 0
    private let chatsViewTag = 0
    private let contactsViewTag = 1
    private let settingsViewTag = 2
    @EnvironmentObject var viewModel : AuthViewModel
    
    var body: some View {
        NavigationView{
            TabView(selection: $selectedIndex){
                ConversationView()
                    .onTapGesture {
                        selectedIndex = chatsViewTag
                    }
                    .tabItem{ Image(systemName : "bubble.left")}
                    .tag(chatsViewTag)
                
                NewMessageView()
                    .onTapGesture{
                        selectedIndex = contactsViewTag
                    }
                    .tabItem{ Image(systemName: "person.3.fill")}
                    .tag(contactsViewTag)
                SettingsView()
                    .onTapGesture {
                        selectedIndex = settingsViewTag
                    }
                    .tabItem{ Image(systemName : "gear")}
                    .tag(settingsViewTag)
            }
            .navigationTitle(tabTitle)
        }
        .navigationBarHidden(true)
        .onAppear{
            viewModel.fetchUser()
        }
    }
    
    var tabTitle : String{
        switch selectedIndex{
        case chatsViewTag: return "Chats"
        case contactsViewTag: return "Contacts"
        case settingsViewTag: return "Settings"
        default: return ""
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
