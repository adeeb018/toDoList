//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Adeeb K on 22/07/24.
//

import Foundation
import FirebaseFirestore

/// viewModel for list of items view
/// Primary tab
class ToDoListViewViewModel : ObservableObject{
    @Published var showingNewItemView = false
    
    private let userId: String
    init(userId: String){
        self.userId = userId
    }
    
    /// Delete to do list item
    /// - Parameter id: item id to delete
    func delete(id: String) {
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
