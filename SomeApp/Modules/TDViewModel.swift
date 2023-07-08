//
//  TDViewModel.swift
//
//  Created by Steellson.
//

import Foundation
import RxCocoa
import RxSwift

protocol TDViewModelTypeProtocol {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
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


//MARK: - TDViewModelTypeProtocol Extension

extension TDViewModel: TDViewModelTypeProtocol {
    
    struct Input {
        let text: Driver<String>
        let start: Driver<Void>
    }
    
    struct Output {
        let isEmpty: Driver<Bool>
        let start: Driver<Void>
    }
    
    func transform(input: Input) -> Output {
        
        let isEmpty = input.text
            .withLatestFrom(input.text)
            .map { !$0.isEmpty }
        
        let start = input.start
            .withLatestFrom(input.text)
            .map { [realmManager] text in
                text.isEmpty
                ? print("empty")
                : realmManager.setupClient(with: text);#warning("Need to add transition")
            }

        return Output(isEmpty: isEmpty, start: start)
    }
}

