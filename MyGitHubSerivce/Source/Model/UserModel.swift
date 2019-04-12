//
//  UserModel.swift
//  MyGitHubSerivce
//
//  Created by 조서현 on 2019. 4. 1..
//  Copyright © 2019년 조서현. All rights reserved.
//

import Foundation


// 승진: 모델 따로따로 파일 만들어서 관리해!

struct UserModel : Codable {
    var avatar_url : URL?
    var id : Int?
    var login : String?
    var name : String?
    
}
