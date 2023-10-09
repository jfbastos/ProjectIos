//
//  ChatCell.swift
//  ProjectIos (iOS)
//
//  Created by user216021 on 10/9/23.
//

import SwiftUI

struct ChatCell: View {
    var body: some View {
        VStack {
            HStack{
                Image("Android_robot.svg")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 4){
                    Text("Android")
                        .font(.system(size : 14, weight: .semibold))
                    
                    Text("What's up bitted apple dude")
                        .font(.system(size: 15))
                }
                
                Spacer()
            }.padding(.horizontal)
            
            Divider()
        }
        .padding(.top)
    }
}

struct ChatCell_Previews: PreviewProvider {
    static var previews: some View {
        ChatCell()
    }
}
