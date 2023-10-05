//
//  SettingsCell.swift
//  ProjectIos (iOS)
//
//  Created by user216021 on 10/5/23.
//

import SwiftUI

struct SettingsCell: View {
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "star.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width : 22, height : 22)
                    .padding(6)
                    .background(Color.yellow)
                    .foregroundColor(.white)
                    .cornerRadius(6)
                
                Text("Starred Messages")
                    .font(.system(size : 15))
                
                Spacer()
                
                Image(systemName : "chevron.right")
                    .foregroundColor(.gray)
                
            }
            .padding([.top, .horizontal])
            Divider()
                .padding(.leading)
        }
        .background(Color.white)
    }
}

struct SettingsCell_Previews: PreviewProvider {
    static var previews: some View {
        SettingsCell()
    }
}
