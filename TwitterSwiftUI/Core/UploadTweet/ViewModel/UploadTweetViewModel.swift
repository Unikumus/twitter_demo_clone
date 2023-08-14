//
//  UploadTweetViewModel.swift
//  TwitterSwiftUI
//
//  Created by Евгений Воронцов on 06.01.2023.
//

import Foundation

class UploadTweetViewModel: ObservableObject {
    @Published var didUploadTweet = false
    
    let service = TweetService()
    
    func uploadTweet(withCaption caption: String ){
        service.uploadTweet(caption: caption){ success in
            if success {
                self.didUploadTweet = true
            } else {
                
            }
        }
    }
}
