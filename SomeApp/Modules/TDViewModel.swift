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
        let validate: Driver<String>
    }
    
    struct Output {
        let isValid: Driver<Bool>
    }
    
    func transform(input: Input) -> Output {
        
        let isValid = input.validate
            .withLatestFrom(input.validate)
            .map { $0.isEmpty ? false : true }

        return Output(isValid: isValid)
    }
}
