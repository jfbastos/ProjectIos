//
//  ChatViewModel.swift
//  ProjectIos (iOS)
//
//  Created by user216021 on 10/10/23.
//

import Foundation

class ChatViewModel: ObservableObject{
    
    @Published var messages = [Message]()
    
    init(){
        messages = mockMessages
    }
    
    var mockMessages: [Message]{
        [
            .init(isFromCurrentUser : true, messageText: "Hey what's up ma' dude"),
            .init(isFromCurrentUser : true, messageText: "Doing good?"),
            .init(isFromCurrentUser : false, messageText: "Not to much"),
            .init(isFromCurrentUser : true, messageText: "What's going on"),
            .init(isFromCurrentUser : false, messageText: "Much stuff to learn"),
            .init(isFromCurrentUser : true, messageText: "Yeah, I can imagine"),
            .init(isFromCurrentUser : false, messageText: "Lot things to see that will be descontinued later"),
            .init(isFromCurrentUser : false, messageText: "🤨"),
        ]
    }
    
    func sendMessage(_ messageText: String){
        let message = Message(isFromCurrentUser: true, messageText: messageText)
        messages.append(message)
    }
}
