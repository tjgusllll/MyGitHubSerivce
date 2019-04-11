//
//  GitHubServiceType.swift
//  MyGitHubSerivce
//
//  Created by 조서현 on 2019. 4. 1..
//  Copyright © 2019년 조서현. All rights reserved.
//

import Alamofire
 
protocol GitHubServiceType {
    func requestGitHubAllUser(since: Int, completion: @escaping (Result<[UserModel]>) -> ())
    func requestGitHubUserDetail(name: String, completion: @escaping(Result<UserDetailModel>)->())
    func requestGitHubUserRepository(name: String, page: Int, completion: @escaping(Result<[UserRepositoryModel]>)->())
}
