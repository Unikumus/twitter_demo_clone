//
//  UserService.swift
//  TwitterSwiftUI
//
//  Created by Евгений Воронцов on 06.01.2023.
//

import Firebase
import FirebaseFirestoreSwift

struct UserService {
    func fetchUser(withUid uid: String, completion: @escaping(User) -> Void) {
        print("DEBUG: Fetch user infl...")
        
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, _ in
                
                guard let snapshot = snapshot else {return}
                
                guard let user = try? snapshot.data(as: User.self) else {return}
//                guard let user = try? snapshot.data(with: <#T##ServerTimestampBehavior#>)
//                guard let user = try? snapshot.data()
                
//                print("DEBUG username is \(user.username)")
                
                completion(user)
                
            }
    }
    
    
    func fetchUsers(completion: @escaping([User]) -> Void){
        Firestore.firestore().collection("users")
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                let users = documents.compactMap( { try? $0.data(as: User.self) })
                completion(users)
            }
        
    }
}
