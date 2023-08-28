//
//  ClassList.swift
//  CleanArchitecture-SwiftVersion
//
//  Created by 김재윤 on 2023/08/28.
//

import Foundation

struct ClassListResult: Codable {
    let count: Int
    let classList: [ClassList]
    
    enum CodingKeys: String, CodingKey {
        case count
        case classList = "results"
    }
}

struct ClassList: Codable, Hashable {
    let index: String
    let name: String
    let url: String
}
