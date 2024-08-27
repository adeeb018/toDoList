//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Adeeb K on 22/07/24.
//

import Foundation

class NewItemViewViewModel : ObservableObject{
    @Published var title = ""
    @Published var dueDate = Date()
    init(){
        
    }
    
    func save(){
        
    }
}

