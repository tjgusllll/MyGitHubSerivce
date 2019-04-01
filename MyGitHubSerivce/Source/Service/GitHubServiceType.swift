//
//  GitHubServiceType.swift
//  MyGitHubSerivce
//
//  Created by 조서현 on 2019. 4. 1..
//  Copyright © 2019년 조서현. All rights reserved.
//

import Alamofire
 
protocol GitHubServiceType {
    func requestGitHubAllUser(completion: @escaping (Result<[UserModel]>) -> ())
}
