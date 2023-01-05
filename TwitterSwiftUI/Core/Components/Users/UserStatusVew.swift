//
//  UserStatusVew.swift
//  TwitterSwiftUI
//
//  Created by Евгений Воронцов on 13.12.2022.
//

import SwiftUI

struct UserStatusVew: View {
    var body: some View {
        HStack(spacing: 24){
            HStack(spacing: 4){
                Text("807")
                    .font(.subheadline)
                    .bold()
                
                
                Text("Following")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            HStack(spacing: 4){
                Text("6,9M")
                    .font(.subheadline)
                    .bold()
                
                
                Text("Followers")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct UserStatusVew_Previews: PreviewProvider {
    static var previews: some View {
        UserStatusVew()
    }
}
