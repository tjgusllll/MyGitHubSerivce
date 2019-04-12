//
//  UserRepositoryModel.swift
//  MyGitHubSerivce
//
//  Created by 조서현 on 2019. 4. 12..
//  Copyright © 2019년 조서현. All rights reserved.
//

import Foundation

struct UserRepositoryModel : Codable {
    var name : String?
    var description : String?
    var stargazers_count : Int?
    var watchers_count : Int?
    var created_at : String?
}
