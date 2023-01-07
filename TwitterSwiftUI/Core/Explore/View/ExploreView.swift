//
//  ExploreView.swift
//  TwitterSwiftUI
//
//  Created by Евгений Воронцов on 11.12.2022.
//

import SwiftUI

struct ExploreView: View {
    @ObservedObject var viewModel = ExploreViewModel()
     
    
    var body: some View {
        VStack {
            SearchBar(text: $viewModel.searchText)
                .padding()
            
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.serchableUsers){user in
                        NavigationLink {
                            ProfileVIew(user: user)
                        } label: {
                            UserRowView(user: user)
                        }
                    }
                }
            }
        }
        .navigationTitle("Explore")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
