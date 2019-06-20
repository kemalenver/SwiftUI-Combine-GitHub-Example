//
//  SearchReposViewModel.swift
//  SwiftUI+Combine+GitHub-Example
//
//  Created by Kemal on 20/6/19.
//  Copyright © 2019 Kemal. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

final class SearchReposViewModel: BindableObject {

    var didChange = PassthroughSubject<SearchReposViewModel, Never>()
    
    var repos = [Repo]() {
        didSet {
            didChange.send(self)
        }
    }
    
    //https://developer.github.com/v3/search/#search-repositories
    func load() {
        
        let path = Bundle.main.path(forResource: "repos_response", ofType: "json")!
        let url = URL(fileURLWithPath: path)
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map({ (published) -> Data in
                published.data
            })
            .decode(type: ReposResponse.self, decoder: JSONDecoder())
            .map({ (repResponse) -> [Repo] in
                repResponse.items
            })
            .replaceError(with: [])
            .sink(receiveValue: { (repos) in
                DispatchQueue.main.async {
                    self.repos = repos
                }
            })
    }
    
    func loadFromAPI(_ searchTerm: String) {
        
        var urlComponents = URLComponents(string: "https://api.github.com/search/repositories")!
        urlComponents.queryItems = [
            URLQueryItem(name: "q", value: searchTerm)
        ]
        
        var request = URLRequest(url: urlComponents.url!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTaskPublisher(for: request)
            .map({ (published) -> Data in
                published.data
            })
            .decode(type: ReposResponse.self, decoder: JSONDecoder())
            .map({ (repResponse) -> [Repo] in
                repResponse.items
            })
            .replaceError(with: [])
            .sink(receiveValue: { (repos) in
                DispatchQueue.main.async {
                    self.repos = repos
                }
            })
    }
}
