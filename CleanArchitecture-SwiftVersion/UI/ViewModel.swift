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
        let classList: AnyPublisher<[ClassList], Never>
    }
    
    private var calcelableBag = [AnyCancellable]()
    
    /// Output
    private let classList = PassthroughSubject<[ClassList], Never>()
    
    /// UseCase
    private let fetchClassListUseCase: FetchClassListUseCase
    
    init(fetchClassListUseCase: FetchClassListUseCase) {
        self.fetchClassListUseCase = fetchClassListUseCase
    }
    
    public func bind(input: Input) -> Output {
        
        /// Input
        input.fetchList.sink { _ in
            Task {
                let result = await self.fetchClassListUseCase.execute()
                
                if case .success(let classList) = result {
                    self.classList.send(classList)
                }
            }
        }
        .store(in: &calcelableBag)
        /// Output
        return Output(
            classList: classList.eraseToAnyPublisher()
        )
    }
}
