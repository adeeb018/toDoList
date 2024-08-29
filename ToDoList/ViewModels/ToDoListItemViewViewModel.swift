//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by Adeeb K on 22/07/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

/// viewModel for single to do list item view(each row in items list)
/// Primary tab
class ToDoListItemViewViewModel : ObservableObject{
    
    init(){
        
    }
    
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
