//
//  ServiceError.swift
//  MyGitHubSerivce
//
//  Created by 조서현 on 2019. 4. 1..
//  Copyright © 2019년 조서현. All rights reserved.
//

import Foundation

enum ServiceError: Error {
    case unknown
    case requestFailed(Error)
    case decodeError
}
