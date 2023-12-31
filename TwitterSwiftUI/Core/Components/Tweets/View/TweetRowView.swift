//
//  TweetRowView.swift
//  TwitterSwiftUI
//
//  Created by Евгений Воронцов on 11.12.2022.
//

import SwiftUI
import Kingfisher

struct TweetRowView: View {
    @ObservedObject var viewModel: TweetRowViewModel
    
    init(tweet: Tweet) {
        
        self.viewModel = TweetRowViewModel(tweet: tweet)
    }
    
    
    var body: some View {
        VStack(alignment: .leading) {
            
            // profile image + user info + tweet
            if let user = viewModel.tweet.user {
                HStack(alignment: .top, spacing: 12) {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 56, height: 56)
                    
                    
                    // user info & tweet caption
                    VStack (alignment: .leading, spacing: 4) {
                        // user info
                        HStack {
                            Text(user.fullname)
                                .font(.subheadline).bold()
                            
                            Text("@\(user.username)")
                                .foregroundColor(.gray)
                                .font(.caption)
                            
                            Text("2W")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                        
                        // tweet caption
                        
                        Text(viewModel.tweet.caption)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                    }
                }
            }
            
            // action buttons
            HStack {
                
                Button {
                    // action goes hers...
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    // action goes hers...
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    viewModel.tweet.didLike ?? false ? viewModel.unLikeTweet() : viewModel.likeTweet()
                } label: {
                    Image(systemName: viewModel.tweet.didLike ?? false ? "heart.fill" : "heart")
                        .font(.subheadline)
                        .foregroundColor(viewModel.tweet.didLike ?? false ? .red : .gray)
                }
                
                Spacer()
                
                Button {
                    // action goes hers...
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }
                
                
                
            }
            .padding()
            .foregroundColor(.gray)
            
            Divider()
        }
    }
}

//struct TweetRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        TweetRowView()
//    }
//}
