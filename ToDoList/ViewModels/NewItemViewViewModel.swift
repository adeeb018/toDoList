//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Adeeb K on 22/07/24.
//

import FirebaseAuth
import Foundation
import FirebaseFirestore

class NewItemViewViewModel : ObservableObject{
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    init(){
        
    }
    
    func save(){
        guard canSave else {
            return
        }
        // Get Current User ID
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        // Create a Model
        let newId = UUID().uuidString
        let newItem = ToDoListItem(id: newId, title: title, dueDate: dueDate.timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false)
        // Save Model
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
    }
    
    var canSave : Bool{
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        return true
    }
}

