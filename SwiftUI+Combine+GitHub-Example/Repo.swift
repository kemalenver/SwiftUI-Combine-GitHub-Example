//
//  Repo.swift
//  SwiftUI+Combine+GitHub-Example
//
//  Created by Kemal on 20/6/19.
//  Copyright © 2019 Kemal. All rights reserved.
//

import Foundation
import SwiftUI

struct ReposResponse: Codable {
    var items: [Repo]
}

struct Repo: Codable, Identifiable {
    
    var id: Int
    var node_id: String
    var name: String
    var full_name: String
    var description: String
    var stargazers_count: Int
    var watchers_count: Int
    var language: String
}
