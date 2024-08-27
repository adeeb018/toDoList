//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Adeeb K on 22/07/24.
//

import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    func login(){
        guard validate() else {
            return
        }
        print("Login Called")
        // Try Login
        Auth.auth().signIn(withEmail: email, password: password){ authResult, error in
            if let error = error{
                if(error.localizedDescription == "The supplied auth credential is malformed or has expired."){
                    //login error
                    self.errorMessage = "Entered Email or password is not valid"
                }else{
                    //other error
                    self.errorMessage = error.localizedDescription
                }
                print("Error:\(error.localizedDescription)")
            }else{
                
                print("Successfully Signed In")
            }
        }
        print("Login Called")
    }
    
    private func validate() -> Bool{
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            
            errorMessage = "Please fill in all fields."
            return false
        }
        // email@foo.com
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email."
            return false
        }
        return true
    }
}
