//
//  MainViewViewModel.swift
//  ToDoList
//
//  Created by Adeeb K on 22/07/24.
//

import Foundation
import FirebaseAuth
import Combine

class MainViewViewModel : ObservableObject{
    @Published var currentUserId : String = ""
    private var handler : AuthStateDidChangeListenerHandle?
    
    init(){
        self.handler = Auth.auth().addStateDidChangeListener{ [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
                // used for updating currentUser if deleted from firebase.
//                do{
//                    try Auth.auth().signOut()
//                }catch{
//                    print("Error")
//                }
            }
        }
    }
    
    public var isSignedIn: Bool{
        
        if let user = Auth.auth().currentUser {
            print("Current User: \(user)")
        } else {
            print("No user is currently signed in.")
        }
        return Auth.auth().currentUser != nil
    }
}
