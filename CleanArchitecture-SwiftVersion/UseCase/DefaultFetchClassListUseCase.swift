//
//  DefaultFetchClassListUseCase.swift
//  CleanArchitecture-SwiftVersion
//
//  Created by 김재윤 on 2023/08/28.
//

import Foundation

struct DefaultFetchClassListUseCase: FetchClassListUseCase {
    
    private let repository: DnDRepository
    
    init(repository: DnDRepository) {
        self.repository = repository
    }
    
    func execute() async -> Result<[ClassList], Error> {
        let classList = await repository.fetchClassList()
        
        switch classList {
        case .success(let result):
            return .success(result.classList)
        case .failure(let error):
            return .failure(error)
        }
    }
}
