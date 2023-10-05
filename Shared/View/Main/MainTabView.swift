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
    private let channelsViewTag = 1
    private let settingsViewTag = 2
    
    var body: some View {
        NavigationView{
            TabView(selection: $selectedIndex){
                ConversationView()
                    .onTapGesture {
                        selectedIndex = chatsViewTag
                    }
                    .tabItem{ Image(systemName : "bubble.left")}
                    .tag(chatsViewTag)
                    
                ChannelsView()
                    .onTapGesture {
                        selectedIndex = channelsViewTag
                    }
                    .tabItem{ Image(systemName : "bubble.left.and.bubble.right")}
                    .tag(channelsViewTag)
                
                SettingsView()
                    .onTapGesture {
                        selectedIndex = settingsViewTag
                    }
                    .tabItem{ Image(systemName : "gear")}
                    .tag(settingsViewTag)
            }
            .navigationTitle(tabTitle)
        }
    }
    
    var tabTitle : String{
        switch selectedIndex{
        case chatsViewTag: return "Chats"
        case channelsViewTag: return "Channels"
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
