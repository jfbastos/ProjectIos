//
//  EditProfileView.swift
//  ProjectIos (iOS)
//
//  Created by user216021 on 10/5/23.
//

import SwiftUI
import Kingfisher

struct EditProfileView: View {
    @State private var fullname = ""
    @State private var showImagePicker = false
    @State private var showStatusPicker = false
    @State private var selectedImage : UIImage?
    @State private var profileImage : Image?
    @State private var userStatus : String?
    @EnvironmentObject var viewModel : AuthViewModel
        
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
                                KFImage(URL(string: viewModel.currentUser?.profileImageUrl ?? "") )
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
                    
                    TextField(viewModel.currentUser?.fullname ?? "", text: $fullname)
                        .padding(8)
                }
                .padding()
                .background(.white)
                
                VStack(alignment : .leading){
                    Text("Status")
                        .padding()
                        .foregroundColor(.gray)
                    
                    Button(action: {
                        showStatusPicker.toggle()
                    }, label: {
                        if let status = userStatus {
                            HStack{
                                Text(status)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .background(Color.white)
                        }else{
                            HStack{
                                Text(viewModel.currentUser?.status ?? "Available")
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .background(Color.white)
                        }
                    })
                        .fullScreenCover(isPresented: $showStatusPicker, onDismiss: updateStatus){
                            StatusSelectorView(currentStatus: $userStatus)
                        }
                }
                Spacer()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Edit Profile")
        .onAppear{
            viewModel.fetchUser()
        }
    }
    
    func loadImage(){
        guard let selectedImage = selectedImage else {return}
        viewModel.updateProfileImage(selectedImage)
        profileImage = Image(uiImage: selectedImage)
    }
    
    func updateStatus(){
        guard let userStatus = userStatus else {return}
        viewModel.updateStatus(status: userStatus)
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
