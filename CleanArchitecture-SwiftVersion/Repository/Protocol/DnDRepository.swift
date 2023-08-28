//
//  DnDRepository.swift
//  CleanArchitecture-SwiftVersion
//
//  Created by 김재윤 on 2023/08/28.
//

import Foundation

protocol DnDRepository {
    func fetchClassList() async -> Result<ClassListResult, Error> 
}
