//
//  User.swift
//  TwitterSwiftUI
//
//  Created by Евгений Воронцов on 06.01.2023.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
}
