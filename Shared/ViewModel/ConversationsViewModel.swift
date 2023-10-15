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
        Task{
            await fetchRecentMessages()
        }
    }
    
    @MainActor
    func fetchRecentMessages() async{
        Task{
            do{
                self.recentMessages = try await fetchRecentMessagesFromFirebase()
            }catch{
                print("ERROR: Error on fetching messages. Details : \(error)")
            }
        }
    }
    
    func fetchRecentMessagesFromFirebase() async throws -> [Message]{
        guard let uid = AuthViewModel.shared.userSession?.uid else {return []}
        
        var tempList = [Message]()
        
        let query = COLLECTION_MESSAGES
            .document(uid)
            .collection("recent_messages")
            .order(by: "timestamp", descending: true)
            
        
        let snapshots = try? await query.getDocuments()
        
        guard let documents = snapshots?.documents else {return []}
        
        for document in documents{
            guard var message = try? document.data(as: Message.self) else {return []}
        
            let anotherUserId = message.fromId == uid ? message.toId : message.fromId
            
            if let user = await self.getUserFromMessage(id: anotherUserId){
                message.user = user
            }
            
            tempList.append(message)
        }
        
        print("DEBUG: Fetchet messages \(tempList)")
        
        return tempList
    }
    
    private func getUserFromMessage(id: String) async -> User?{
        do{
            print("DEBUG: Key passed \(id)")
            let user = try await COLLECTION_USERS.document(id).getDocument(as: User.self)
            return user
        }catch{
            print("DEBUG: Exception thrown \(error)")
            return nil
        }
    }
}
