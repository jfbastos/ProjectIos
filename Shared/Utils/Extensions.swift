//
//  Extensions.swift
//  ProjectIos (iOS)
//
//  Created by user216021 on 10/9/23.
//

import UIKit

extension UIApplication{
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from : nil, for : nil)
    }
}
