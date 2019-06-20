//
//  ContentView.swift
//  SwiftUI+Combine+GitHub-Example
//
//  Created by Kemal on 20/6/19.
//  Copyright © 2019 Kemal. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    @ObjectBinding var viewModel = SearchReposViewModel()
    @State var searchString: String = "language:Swift"
    
    var body: some View {
        
        VStack {
            HStack {
                TextField($searchString)
                
                Button(action: {
                    self.viewModel.loadFromAPI(self.searchString)
                }) {
                    Text("Search Repos")
                }
            }.padding()
            
            List(viewModel.repos) { repo in
                RepoRow(repo: repo)
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var viewModel = PreviewData.searchReposViewModel
    
    static var previews: some View {
        ContentView(viewModel: viewModel)
    }
}
#endif
