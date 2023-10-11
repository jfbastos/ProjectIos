//
//  ContentView.swift
//  Shared
//
//  Created by user216021 on 10/2/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel : AuthViewModel
    
    var body: some View {
        Group{
            if viewModel.userSession != nil{
                MainTabView()
            } else {
                LogginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
