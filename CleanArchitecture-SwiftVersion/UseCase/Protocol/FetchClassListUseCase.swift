//
//  FetchClassListUseCase.swift
//  CleanArchitecture-SwiftVersion
//
//  Created by 김재윤 on 2023/08/28.
//

import Foundation

protocol FetchClassListUseCase {
    func execute() async -> Result<[ClassList], Error>
}
 
