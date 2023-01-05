//
//  TwitterSwiftUIApp.swift
//  TwitterSwiftUI
//
//  Created by Евгений Воронцов on 11.12.2022.
//

import SwiftUI
import Firebase

@main
struct TwitterSwiftUIApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ProfilePhotoSelectorView()
//                ContentView()
//                RegistrationView()
            }.environmentObject(viewModel)
            //1 38
            // 2 48
        }
    }
}
