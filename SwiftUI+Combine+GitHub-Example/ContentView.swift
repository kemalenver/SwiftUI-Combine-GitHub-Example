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
        
        NavigationView {
            VStack {
                HStack {
                    TextField($searchString)
                    
                    Button(action: {
                        self.viewModel.loadFromAPI(self.searchString)
                    }) {
                        Text("Search Repos")
                            .font(Font.headline)
                            .foregroundColor(Color.white)
                    }
                }
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(20)
                    .border(Color.green, width: 6.0, cornerRadius: 20.0)
                
                List(viewModel.repos) { repo in
                    NavigationButton(destination: Text("Tapped \(repo.name)")) {
                        RepoRow(repo: repo)
                    }
                }
 
            }.padding(.top)
            
            .navigationBarTitle(Text("Repositories"), displayMode: .inline)
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
