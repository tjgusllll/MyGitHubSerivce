//
//  UserModel.swift
//  MyGitHubSerivce
//
//  Created by 조서현 on 2019. 4. 1..
//  Copyright © 2019년 조서현. All rights reserved.
//

import Foundation

struct UserModel : Codable {
    var avatar_url : URL?
    var id : Int?
    var login : String?
    var name : String?
    
}

struct UserDetailModel : Codable {
    var avatar_url : URL?
    var login : String?
    var name : String?
    var location : String?
    var company : String?
    var followers : Int?
    var following : Int?
}

struct UserRepositoryModel : Codable {
    var name : String?
    var description : String?
    var stargazers_count : Int?
    var watchers_count : Int?
    var created_at : String?
}
