//
//  MessageViewModel.swift
//  ProjectIos (iOS)
//
//  Created by user216021 on 10/13/23.
//

import Foundation

struct MessageViewModel {
    let message: Message
    
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
