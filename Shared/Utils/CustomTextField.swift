//
//  CustomTextField.swift
//  ProjectIos (iOS)
//
//  Created by user216021 on 10/3/23.
//

import SwiftUI

struct CustomTextField: View {
    let imageName : String
    let placeholderText : String
    let isSecureField : Bool
    @Binding var text : String
        
    var body: some View {
        VStack(spacing : 12){
            HStack{
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))
                
                if isSecureField{
                    SecureField(placeholderText, text : $text)
                } else{
                    TextField(placeholderText, text: $text)
                }
                
            }
            Divider().background(Color(.darkGray))
        }
    }
}
