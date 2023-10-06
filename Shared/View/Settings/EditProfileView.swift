//
//  EditProfileView.swift
//  ProjectIos (iOS)
//
//  Created by user216021 on 10/5/23.
//

import SwiftUI

struct EditProfileView: View {
    @State private var fullname = ""
    var body: some View {
        ZStack{
            Color(.systemGroupedBackground).ignoresSafeArea()
            VStack {
                VStack{
                    HStack {
                        VStack{
                            Image("Android_robot.svg")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 64, height: 64)
                                .clipShape(Circle())
                            
                            Button(action: {}, label: {
                                Text("Edit")
                            })
                        }
                        Text("Enter your name or change your profile photo")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                            .padding([.bottom, .horizontal])
                    }
                    
                    Divider()
                        .padding(.horizontal)
                    
                    TextField("", text: $fullname)
                        .padding(8)
                }
                .background(.white)
                
                VStack{
                    HStack{
                        Text("At the movies")
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                }
                Spacer()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Edit Profile")
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
