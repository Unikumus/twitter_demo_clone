//
//  ProfileViewModel.swift
//  TwitterSwiftUI
//
//  Created by Евгений Воронцов on 07.01.2023.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var tweets = [Tweet]()
    @Published var likedTweets = [Tweet]()
    
    private let service = TweetService()
    private let userService = UserService()
    
    let user: User
    
    init(user:User){
        self.user = user
        self.fetchUserTweets()
        self.fetchLikedTweets()
    }
    
    var actuibButtonTitle : String {
        return user.isCurrentUser ? "Edit Profile" : "Follow"
    }
    
    func tweets(forFilter filter: TweetFilterViewModel) -> [Tweet]{
        switch filter {
        case .tweets:
            return tweets
        case .replies:
            return tweets
        case .likes:
            return likedTweets
        }
    }
    
    func fetchUserTweets(){
        guard let uid = user.id else {return}
        service.fetchTweets(forUid: uid) { tweets in
            self.tweets = tweets
             
            for i in 0 ..< tweets.count {
                self.tweets[i].user = self.user
            }
            
        }
    }
    
    func fetchLikedTweets(){
        guard let uid = user.id else {return}
        
        service.fetchTweets(forUid: uid){ tweets in
            self.likedTweets = tweets
            
            
            for i in 0 ..< tweets.count {
                let uid = tweets[i].uid
                
                self.userService.fetchUser(withUid: uid) { user in
                    self.likedTweets[i].user = user
                    
                }
                
            }
        }
    }
}
