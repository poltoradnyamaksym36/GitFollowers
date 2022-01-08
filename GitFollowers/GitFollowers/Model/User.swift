//
//  User.swift
//  GitFollowers
//
//  Created by max36 on 08.01.2022.
//

import Foundation

//MARK: - Model User
struct User: Codable {
    var login: String
    var avatarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    var publicRepos: Int
    var publicGists: Int
    var htmlUrl: String
    var following: Int
    var followers: Int
    var createAt: String
}
