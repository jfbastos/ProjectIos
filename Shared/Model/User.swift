//
//  User.swift
//  ProjectIos (iOS)
//
//  Created by user216021 on 10/12/23.
//

import FirebaseFirestoreSwift
import Foundation

struct User : Identifiable, Decodable{
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let email: String
    let profileImageUrl: String
    let status : String
}

let MOCK_USER = User(id: "129381928429381", username: "MockedUser", fullname: "MockedUser", email: "User", profileImageUrl: "nothing.com", status: "Available")
