//
//  RepoRow.swift
//  SwiftUI+Combine+GitHub-Example
//
//  Created by Kemal on 20/6/19.
//  Copyright © 2019 Kemal. All rights reserved.
//

import SwiftUI

struct RepoRow: View {
    var repo: Repo
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                
                Text(repo.name)
                    .font(Font.headline)
                    .foregroundColor(Color.white)
                
                Spacer()
                
                Text(repo.language)
                    .padding(3)
                    .background(Color.red)
                    .cornerRadius(3)
                    .foregroundColor(Color.white)
                
            }
            
            Text(repo.full_name)
                .font(Font.subheadline)
            
            Text(repo.description)
                .font(Font.subheadline)
                .lineLimit(2)
            
            HStack {
                Spacer()
                Image(systemName: "eyeglasses").foregroundColor(Color.white)
                Text("\(repo.watchers_count)")
                Image(systemName: "star").foregroundColor(Color.yellow)
                Text("\(repo.stargazers_count)")
            }
            }
            .padding()
            .background(Color.init(red: 0.6, green: 0.6, blue: 1))
            .cornerRadius(5)
            .border(Color.gray, width: 3.0, cornerRadius: 5.0)
    }
}

#if DEBUG
struct RepoRow_Previews : PreviewProvider {

    static var viewModel = PreviewData.searchReposViewModel
    static let repo: Repo = Repo(id: 123, node_id: "asdasd", name: "Some Name", full_name: "Full name goes here", description: "This isa long description of the thingy repo and it's even longwer now so there", stargazers_count: 12, watchers_count: 5123, language: "Swift")
    
    static var previews: some View {
        
        RepoRow(repo: repo)
        
    }
}
#endif
