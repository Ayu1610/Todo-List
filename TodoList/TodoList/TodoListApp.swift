//
//  TodoListApp.swift
//  TodoList
//
//  Created by Ayushi Ashok on 06/09/2022.
//

import SwiftUI

@main


struct TodoListApp: App {
    @StateObject var todoViewModel: TodoViewModel = TodoViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(todoViewModel)
        }
    }
}
