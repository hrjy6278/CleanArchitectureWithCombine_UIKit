//
//  ViewModel.swift
//  CleanArchitecture-SwiftVersion
//
//  Created by 김재윤 on 2023/08/24.
//

import Foundation
import Combine

public final class ViewModel {
    
    public struct Input {
        let fetchList: AnyPublisher<Void, Never>
    }
    
    public struct Output {
        
    }
    
    private var calcelableBag = [AnyCancellable]()
    
    public func bind(input: Input) -> Output {
        
        /// Input
        input.fetchList.sink { _ in
            
        }
        .store(in: &calcelableBag)
        
        
        /// Output
        return Output()
    }
}
