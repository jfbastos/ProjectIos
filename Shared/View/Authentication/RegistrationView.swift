//
//  RegistrationView.swift
//  ProjectIos (iOS)
//
//  Created by user216021 on 10/3/23.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var username = ""
    @State private var fullname = ""
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var viewModel: AuthViewModel

    
    var body: some View {
        VStack{
            
            NavigationLink(destination: ProfilePhotoSelect(), isActive: $viewModel.didAuthenticateUser, label: {})
            
            VStack(alignment: .leading, spacing : 12){
                HStack {Spacer()}
                Text("Hello.")
                    .font(.largeTitle)
                    .bold()
                
                Text("Welcome")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.blue)
                                
                VStack(spacing : 32){
                    CustomTextField(
                        imageName: "envelope",
                        placeholderText: "Email",
                        isSecureField : false,
                        text: $email
                    )
                    
                    CustomTextField(
                        imageName: "person",
                        placeholderText: "Username",
                        isSecureField : false,
                        text: $username
                    )
                    
                    CustomTextField(
                        imageName: "person",
                        placeholderText: "Full Name",
                        isSecureField : false,
                        text: $fullname
                    )
                    
                    CustomTextField(
                        imageName: "lock",
                        placeholderText: "Password",
                        isSecureField : true,
                        text: $password
                    )
                    
                }
                .padding([.top, .horizontal], 16)
                
            }
            .padding(.leading)
            
            Button(action: {
                viewModel.register(withEmail: email, password: password, fullname: fullname, username: username)
            }, label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color.blue)
                    .clipShape(Capsule())
                    .padding()
            })
            .shadow(color: .gray, radius: 6, x: 0.0, y: 0.0)
            .padding(.horizontal, 16)
            
            Spacer()
            
            Button(action: {mode.wrappedValue.dismiss()}, label: {
                HStack{
                    Text("Already have an account?")
                        .font(.system(size : 14))
                    Text("Sign in")
                        .font(.system(size:14, weight: .semibold))
                }
            })
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
