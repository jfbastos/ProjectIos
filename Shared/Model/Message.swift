//
//  Message.swift
//  ProjectIos (iOS)
//
//  Created by user216021 on 10/10/23.
//

import FirebaseFirestoreSwift
import Firebase

struct Message : Identifiable, Decodable{
    @DocumentID var id: String?
    let fromId: String
    let toId: String
    let read: Bool
    let text: String
    let timestamp: Timestamp
    
    var user: User?
}
