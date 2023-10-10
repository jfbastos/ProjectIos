//
//  Message.swift
//  ProjectIos (iOS)
//
//  Created by user216021 on 10/10/23.
//

import Foundation

struct Message : Identifiable{
    let id = NSUUID().uuidString
    let isFromCurrentUser : Bool
    let messageText: String
}
