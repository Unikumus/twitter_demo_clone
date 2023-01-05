//
//  TweetFilterViewModel.swift
//  TwitterSwiftUI
//
//  Created by Евгений Воронцов on 11.12.2022.
//

import Foundation

enum TweetFilterViewModel: Int, CaseIterable {
    case tweets
    case replies
    case likes
    
    var title: String {
        switch self {
        case .tweets: return "Tweets"
        case .replies: return "Replies"
        case .likes: return "Likes"
        }
    }
}
