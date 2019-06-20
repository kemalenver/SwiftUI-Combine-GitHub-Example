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
        HStack(alignment: .top) {
            
            VStack(alignment: .leading) {
                Text(repo.name).font(Font.body)
                Text(repo.full_name).font(Font.subheadline)
            }
            
            Text(repo.language)
        }
    }
}

#if DEBUG
struct RepoRow_Previews : PreviewProvider {
    static var testRepo: Repo = {
        Repo(id: 1, node_id: "asd", name: "Some Name", full_name: "Full Name", description: "My Description", stargazers_count: 23, watchers_count: 12, language: "Swift")
    }()
    
    static var previews: some View {
        RepoRow(repo: testRepo)
    }
}
#endif
