//
//  StatusCellViewModel.swift
//  ProjectIos (iOS)
//
//  Created by user216021 on 10/9/23.
//

import SwiftUI

class StatusViewModel : ObservableObject{
    @Published var status : UserStatus = .notConfigured
    
    func updateStatus(_ status: UserStatus){
        self.status = status
    }
}

enum UserStatus : Int, CaseIterable{
    case notConfigured
    case available
    case busy
    case school
    case work
    case meeting
    case gym
    case sleeping
    case urgentCallsOnly
    
    var title : String{
        switch self{
        case .notConfigured:
            return "Click here to update your status"
        case .available:
            return "Available"
        case .busy:
            return "Busy"
        case .school:
            return "At school"
        case .work:
            return "At work"
        case .meeting:
            return "In a meeting"
        case .gym:
           return "At the gym"
        case .sleeping:
            return "Sleeping"
        case .urgentCallsOnly:
            return "Urgent calls only"
        }
    }
    
    
}
