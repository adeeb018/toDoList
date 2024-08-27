//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Adeeb K on 22/07/24.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
