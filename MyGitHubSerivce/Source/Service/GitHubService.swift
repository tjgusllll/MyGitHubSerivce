//
//  GitHubService.swift
//  MyGitHubSerivce
//
//  Created by 조서현 on 2019. 4. 1..
//  Copyright © 2019년 조서현. All rights reserved.
//

import Alamofire
 
class GitHubService: GitHubServiceType {
    func requestGitHubAllUser(completion: @escaping (Result<[UserModel]>) -> ()) {
        // 승진: 보통 이렇게 .다음엔 내려서 쓰는게 좋아
        Alamofire.request(Router.userAll)
            .validate()
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
}
