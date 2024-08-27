//
//  MainViewViewModel.swift
//  ToDoList
//
//  Created by Adeeb K on 22/07/24.
//

import Foundation
import FirebaseAuth

class MainViewViewModel : ObservableObject{
    @Published var currentUserId : String = ""
    private var handler : AuthStateDidChangeListenerHandle?
    
    init(){
        self.handler = Auth.auth().addStateDidChangeListener{ [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool{
        
        print(Auth.auth().currentUser)
        return Auth.auth().currentUser != nil
    }
}
