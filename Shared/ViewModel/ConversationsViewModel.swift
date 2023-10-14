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
        
        let query = COLLECTION_MESSAGES
            .document(uid)
            .collection("recent_messages")
            .order(by: "timestamp", descending: true)
            
        query.addSnapshotListener { snapshot, _ in
            guard let documents = snapshot?.documents else {return}
            
            self.recentMessages = documents.compactMap({try? $0.data(as: Message.self)})
        }
    }
    
}
