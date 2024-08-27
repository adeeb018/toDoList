//
//  RegisterView.swift
//  ToDoList
//
//  Created by Adeeb K on 22/07/24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    var body: some View {
        VStack{
            // HeaderView
            HeaderView(title: "Register", subTitle: "Start organizing tods", angle: -15, background: .orange)
            // Form
            Form{
                TextField("Full Name",text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                TextField("Email",text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .autocorrectionDisabled()
                SecureField("Password",text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                TLButton(title: "Create Account", background: .green){
                    viewModel.register()
                }
                .padding()
            }
        }
        Spacer()
    }
}

#Preview {
    RegisterView()
}
