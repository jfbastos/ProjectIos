//
//  EditProfileView.swift
//  ProjectIos (iOS)
//
//  Created by user216021 on 10/5/23.
//

import SwiftUI

struct EditProfileView: View {
    @State private var fullname = "Jhonny Doe"
    @State private var showImagePicker = false
    @State private var selectedImage : UIImage?
    @State private var profileImage : Image?
    
    var body: some View {
        ZStack{
            Color(.systemGroupedBackground).ignoresSafeArea()
            VStack(alignment : .leading, spacing : 32) {
                VStack{
                    HStack {
                        VStack{
                            if let profileImage = profileImage {
                                profileImage
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 64, height: 64)
                                    .clipShape(Circle())
                            } else {
                                Image(systemName: "person")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 64, height: 64)
                                    .clipShape(Circle())
                            }
                            
                            Button(action: {
                                showImagePicker.toggle()
                            }, label: {
                                Text("Edit")
                            })
                            .fullScreenCover(isPresented: $showImagePicker, onDismiss: loadImage) {
                                ImagePicker(image: $selectedImage)
                            }
                        }
                        .padding(.top)
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
                .padding()
                .background(.white)
                
                VStack(alignment : .leading){
                    Text("Status")
                        .padding()
                        .foregroundColor(.gray)
                    
                    NavigationLink(destination: StatusSelectorView(), label: {
                        HStack{
                            Text("At the movies")
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color.white)
                    })
                }
                Spacer()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Edit Profile")
    }
    
    func loadImage(){
        guard let selectedImage = selectedImage else {return}
        profileImage = Image(uiImage: selectedImage)
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
