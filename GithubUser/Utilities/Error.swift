//
//  Error.swift
//  GithubUser
//
//  Created by Bernardo Cervantes Mayagoitia on 3/3/25.
//

import Foundation

enum GHError: Error {
    case invalidUrl
    case invalidResponse
    case noData
    case decodingFailed
}
