//
//  GitHubUser.swift
//  GithubUser
//
//  Created by Bernardo Cervantes Mayagoitia on 3/3/25.
//

import Foundation

struct GitHubUser: Codable {
    let login: String
    let avatarUrl: String
    let bio: String
}
