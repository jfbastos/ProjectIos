//
//  LogginView.swift
//  ProjectIos (iOS)
//
//  Created by user216021 on 10/3/23.
//

import SwiftUI
import AlertToast

struct LogginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var showToast = false
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
                                               
            VStack {
                VStack(alignment: .leading, spacing : 12){
                    HStack {Spacer()}
                    Text("Hello.")
                        .font(.largeTitle)
                        .bold()
                    
                    Text("Welcome back")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.blue)
                                    
                    VStack(spacing : 20){
                        CustomTextField(
                            imageName: "envelope",
                            placeholderText: "Email",
                            isSecureField : false,
                            text: $email
                        )
                        
                        CustomTextField(
                            imageName: "lock",
                            placeholderText: "Password",
                            isSecureField : true,
                            text: $password
                        )
                    }
                    .padding([.top, .horizontal], 32)
                    
                }
                .padding(.leading)
                
                HStack {
                    Spacer()
                    
                    HStack{
                        Spacer()
                        if email != ""{
                            Button(action: {
                                showToast.toggle()
                            }, label: {
                                Text("Forgot Password?")
                                    .font(.system(size: 13, weight: .semibold))
                                    .padding(.top)
                                    .padding(.trailing, 28)
                            }).alert("Send reset e-mail to \(email) ?",isPresented: $showToast){
                                Button("Cancel", role: .cancel){}
                                Button("Yes", role: .destructive){
                                    viewModel.forgotPassword(email:email)
                                }
                            }
                        }else {
                            Button(action: {
                                showToast.toggle()
                            }, label: {
                                Text("Forgot Password?")
                                    .font(.system(size: 13, weight: .semibold))
                                    .padding(.top)
                                    .padding(.trailing, 28)
                            }).alert("To reset password you must fill e-mail space",isPresented: $showToast){
                                Button("Ok", role: .cancel) {}
                            }
                        }
                        
                        
                        
                    }
                }
                
                Button(action: {
                    viewModel.login(withEmail: email, password: password)
                }, label: {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .padding()
                })
                .shadow(color: .gray, radius: 10, x: 0.0, y: 0.0)
                
                var userPasswordText = Text("User or password invalid.")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.red)
                
                var resetErrorText =  Text("E-mail invalid.")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.red)
                
                HStack{
                    if viewModel.loginErrorOcurred {
                        userPasswordText
                    }else{
                        userPasswordText.hidden()
                    }
                    
                    if let error = viewModel.resetPasswordError {
                        resetErrorText
                    }else{
                        resetErrorText.hidden()
                    }
                }
                
                if viewModel.isLoggedIn {
                    NavigationLink(destination: MainTabView().navigationBarBackButtonHidden(true), label: {})
                }
                                            
                Spacer()
                
                NavigationLink(
                    destination : RegistrationView()
                        .navigationBarBackButtonHidden(true),
                    label:{
                        HStack{
                            Text("Don't have an account?")
                                .font(.system(size : 14))
                            Text("Sign up")
                                .font(.system(size:14, weight: .semibold))
                        }
                        
                    }).padding(.bottom, 32)
            }
        }
        .padding(.top, -56)
    }
}


