//
//  MessageViewModel.swift
//  ProjectIos (iOS)
//
//  Created by user216021 on 10/13/23.
//

import Foundation

class MessageViewModel : ObservableObject{
    
    let message: Message
    
    init(_ message: Message){
        self.message = message
    }
    
    var currentUid: String{
        return AuthViewModel.shared.userSession?.uid ?? ""
    }
    
    var isFromCurrentUser: Bool {
        return message.fromId == currentUid
    }
    
    var profileImageUrl: URL?{
        return URL(string: message.user?.profileImageUrl ?? "")
    }
    
    
}
