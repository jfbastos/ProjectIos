//
//  StatusSelectorView.swift
//  ProjectIos (iOS)
//
//  Created by user216021 on 10/9/23.
//

import SwiftUI

struct StatusSelectorView: View {
    @ObservedObject var viewModel = StatusViewModel()
    @Environment(\.presentationMode) var mode
    @Binding var currentStatus : String?
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground).ignoresSafeArea()
            
            VStack{
                HStack{
                    Spacer()
                    Button(
                        action: {mode.wrappedValue.dismiss()},
                        label: {Text("Cancel")}
                    )
                }.padding()
                
                ScrollView{
                    VStack (alignment: .leading){
                        Text("Currenty set to")
                            .foregroundColor(.gray)
                            .padding()
                            
                        StatusCell(status: viewModel.status)
                        
                        Text("Select yout status")
                            .foregroundColor(.gray)
                            .padding()
                        
                        ForEach(UserStatus.allCases.filter({$0 != .notConfigured}), id: \.self) { status in
                            Button(action: {
                                self.currentStatus = status.title
                                mode.wrappedValue.dismiss()
                            }, label: {StatusCell(status: status)})
                        }
                    }
                }
            }
        }
    }
}

struct StatusCell: View {
    let status: UserStatus
    
    var body: some View {
        HStack{
            Text(status.title)
                .foregroundColor(Color.black)
            Spacer()
        }
        .frame(height : 56)
        .padding(.horizontal)
        .background(Color.white)
        
    }
}
