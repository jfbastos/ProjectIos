//
//  StatusSelectorView.swift
//  ProjectIos (iOS)
//
//  Created by user216021 on 10/9/23.
//

import SwiftUI

struct StatusSelectorView: View {
    @ObservedObject var viewModel = StatusViewModel()
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground).ignoresSafeArea()
            
            ScrollView{
                VStack (alignment: .leading){
                    Text("Currentry set to")
                        .foregroundColor(.gray)
                        .padding()
                        
                    StatusCell(status: viewModel.status)
                    
                    Text("Select yout status")
                        .foregroundColor(.gray)
                        .padding()
                    
                    ForEach(UserStatus.allCases.filter({$0 != .notConfigured}), id: \.self) { status in
                        Button(action: {
                            viewModel.updateStatus(status)
                        }, label: {StatusCell(status: status)})
                    }
                }
            }
        }
    }
}

struct StatusSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        StatusSelectorView()
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
