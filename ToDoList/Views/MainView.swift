//
//  ContentView.swift
//  ToDoList
//
//  Created by Adeeb K on 22/07/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{
            // signed In
            accountView
        }else{
            LoginView()
        }
    }
    @ViewBuilder
    var accountView : some View{
        TabView{
            ToDoListView(userId : viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    MainView()
}
