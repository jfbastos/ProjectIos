//
//  ProfilePhotoSelect.swift
//  ProjectIos (iOS)
//
//  Created by user216021 on 10/11/23.
//

import SwiftUI

struct ProfilePhotoSelect: View {
    @State private var imagePickerPresented = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @State private var doLogin : Bool = true
    @EnvironmentObject var viewModel: AuthViewModel

    
    var body: some View {
        VStack{
            
            NavigationLink(destination: MainTabView().navigationBarBackButtonHidden(true), isActive: $viewModel.isLoggedIn ,label: {})
            
            Button(action: {imagePickerPresented.toggle()}, label:{
                if let profileImage = profileImage{
                    profileImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .clipShape(Circle())
                }else{
                    Image("plus_photo")
                        .resizable().renderingMode(.template)
                        .scaledToFill()
                        .frame(width : 180, height: 180)
                        .clipped()
                        .padding(.top, 44)
                        .foregroundColor(.black)
                }
            })
                .fullScreenCover(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {
                    ImagePicker(image : $selectedImage)
                })
            
            Text(profileImage == nil ? "Select a profile photo" : "Great!")
                .font(.system(size: 20, weight: .semibold))
            
            if let image = selectedImage {
                Button(action : {
                    viewModel.uploadProfileImage(image)
                }, label : {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .padding()
                })
                    .shadow(color: .gray, radius: 10, x: 0.0, y: 0.0)
                    .padding(.top, 24)
            }
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func loadImage(){
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage : selectedImage)

    }
}

struct ProfilePhotoSelect_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelect()
    }
}
