//
//  ConversationsViewModel.swift
//  ProjectIos (iOS)
//
//  Created by user216021 on 10/13/23.
//

import SwiftUI

class ConversationsViewModel: ObservableObject{
    @Published var recentMessages = [Message]()
    
    init(){
        fetchRecentMessages()
    }
    
    func fetchRecentMessages(){
        guard let uid = AuthViewModel.shared.userSession?.uid else {return}
        
        COLLECTION_MESSAGES
            .document(uid)
            .collection("recent-messages")
            .order(by: "timestamp", descending: true)
            .getDocuments{ snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                
                self.recentMessages = documents.compactMap({try? $0.data(as: Message.self)})
            
            }
    }
    
}
