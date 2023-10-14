//
//  ChatCellViewModel.swift
//  ProjectIos (iOS)
//
//  Created by user216021 on 10/14/23.
//

import Firebase

class ChatCellViewModel : ObservableObject{
    @Published var message: Message
    
    init(_ message: Message){
        self.message = message
        fetchUser()
    }
    
    var chatPartnerId: String{
        return message.fromId == AuthViewModel.shared.userSession?.uid ? message.toId : message.fromId
    }
    
    var chatProfilePartnetUrl: URL?{
        return URL(string: message.user?.profileImageUrl ?? "")
    }
    
    var fullname : String{
        guard let user = message.user else { return ""}
        return user.fullname
    }
    
    func fetchUser(){
        COLLECTION_USERS.document(chatPartnerId).getDocument{ snapshot, _ in
            self.message.user = try? snapshot?.data(as: User.self)
        }
    }
}
