//
//  PreviewData.swift
//  SwiftUI+Combine+GitHub-Example
//
//  Created by Kemal Enver on 20/06/2019.
//  Copyright © 2019 Kemal. All rights reserved.
//

import Foundation

class PreviewData {

    static var searchReposViewModel: SearchReposViewModel = {
       
        let searchReposViewModel = SearchReposViewModel()
        searchReposViewModel.load()
        return searchReposViewModel
    }()
    
}
