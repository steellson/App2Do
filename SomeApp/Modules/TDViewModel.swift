//
//  TDViewModel.swift
//
//  Created by Steellson.
//

import Foundation
import RxCocoa
import RxSwift

protocol TDViewModelProtocol {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}

protocol TDViewModelErrorHandlingProtocol {
    associatedtype TDViewModelErrors
}


final class TDViewModel {
    
    private let realmManager: RealmManager
    private let dateService: DateServiceProtocol
    private let disposeBag = DisposeBag()
    
    
    init(realmManager: RealmManager,
         dateService: DateServiceProtocol) {
        
        self.realmManager = realmManager
        self.dateService = dateService
    }
}


//MARK: - TDViewModelProtocol Extension

extension TDViewModel: TDViewModelProtocol {
    
    struct Input {
        let text: Driver<String>
    }
    
    struct Output {
        let isEmpty: Driver<Bool>
    }
    
    func transform(input: Input) -> Output {
        
        let isValid = input.text
            .withLatestFrom(input.text)
            .map { !$0.isEmpty }

        return Output(isEmpty: isValid)
    }
}
