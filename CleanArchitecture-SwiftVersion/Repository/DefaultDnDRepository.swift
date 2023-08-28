//
//  DefaultDnDRepository.swift
//  CleanArchitecture-SwiftVersion
//
//  Created by 김재윤 on 2023/08/28.
//

import Foundation

enum DnDError: Error {
    case sessionError
    case networkError
}

struct DefaultDnDRepository: DnDRepository {
    
    private let provider = URLSession.shared
    
    func fetchClassList() async -> Result<ClassListResult, Error> {
        
        let api = DnDAPI.classList
        
        do {
            let (data, response) = try await provider.data(for: api.urlRequest)
            
            guard let response = response as? HTTPURLResponse,
                  (200...299).contains(response.statusCode) else {
                return .failure(DnDError.sessionError)
            }
            
            let classListResult = try JSONDecoder().decode(ClassListResult.self, from: data)
            
            return .success(classListResult)
        } catch {
            return .failure(DnDError.networkError)
        }
    }
}

