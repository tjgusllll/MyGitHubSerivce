//
//  GitHubService.swift
//  MyGitHubSerivce
//
//  Created by 조서현 on 2019. 4. 1..
//  Copyright © 2019년 조서현. All rights reserved.
//

import Alamofire
 
class GitHubService: GitHubServiceType {
    func requestGitHubAllUser(since: Int, completion: @escaping (Result<[UserModel]>) -> ()) {
        Alamofire.request(Router.userAll(since: since)) 
            .validate(statusCode: 200..<400)
            .responseData { response in
            switch response.result {
            case .success(let value):
                do {
                    let result = try JSONDecoder().decode([UserModel].self, from: value)
                    //print(result)
                    completion(Result.success(result))
                } catch {
                    completion(Result.failure(ServiceError.decodeError))
                }
            case .failure(let error):
                completion(Result.failure(ServiceError.requestFailed(error)))
            }
        }
    }
    

    func requestGitHubUserDetail(name: String, completion: @escaping (Result<UserDetailModel>) -> ()) {
        Alamofire.request(Router.userDetail(name: name))
            .validate(statusCode: 200..<400)
            .responseData { response in
                switch response.result {
                case .success(let value):
                    do {
                        let result = try JSONDecoder().decode(UserDetailModel.self, from: value)
                        completion(Result.success(result))
                    } catch {
                        completion(Result.failure(ServiceError.decodeError))
                    }
                case .failure(let error):
                    completion(Result.failure(ServiceError.requestFailed(error)))
            }
        }
    }
    
    
    func requestGitHubUserRepository(name: String, page: Int, completion: @escaping(Result<[UserRepositoryModel]>)->()) {
        Alamofire.request(Router.userRepos(name: name, page: page))
            .validate(statusCode: 200..<400)
            .responseData { response in
                switch response.result {
                case .success(let value):
                    do {
                        let result = try JSONDecoder().decode([UserRepositoryModel].self, from: value)
                        completion(Result.success(result))
                    } catch {
                        completion(Result.failure(ServiceError.decodeError))
                    }
                case .failure(let error):
                    completion(Result.failure(ServiceError.requestFailed(error)))
            }
        }
    }
}
