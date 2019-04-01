//
//  UserModel.swift
//  MyGitHubSerivce
//
//  Created by 조서현 on 2019. 4. 1..
//  Copyright © 2019년 조서현. All rights reserved.
//

import Foundation

struct UserModel : Codable{
    
    var avatar_url : URL?
    var id : Int?
    var login : String?
}

//승진: 이렇게 만드는거 ㄴ ㄴ
//var userlist : [UserModel] = [UserModel]()
