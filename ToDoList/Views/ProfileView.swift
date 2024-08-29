//
//  ProfileView.swift
//  ToDoList
//
//  Created by Adeeb K on 22/07/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    var body: some View {
        NavigationView{
            VStack{
                if let user = viewModel.user {
                    profileView(user: user)
                } else {
                    Text("Loading Profile .....")
                }
            }.navigationTitle("Profile")
        }
        .onAppear() {
            viewModel.fetchUser()
        }
    }
    @ViewBuilder func profileView(user: User) -> some View {
        // Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width: 125,height: 125)
            .padding()
        
        // info, name, email, member since
        VStack(alignment: .leading){
            HStack{
                Text("Name: ")
                    .bold()
                Text(user.name)
            }
            HStack{
                Text("Email: ")
                    .bold()
                Text(user.email)
            }
            HStack{
                Text("Member since: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
        }
        .padding()
        // Sign out
        Button("Log out"){
            viewModel.logOut()
        }.tint(Color.red)
            .padding()
        Spacer()
    }
}

#Preview {
    ProfileView()
}
