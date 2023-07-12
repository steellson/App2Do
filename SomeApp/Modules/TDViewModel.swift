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


final class TDViewModel: TDViewModelTypeProtocol {
    
    struct Input {
        let nameFieldText: Driver<String>
        let startButtonTap: Driver<Void>
    }
    
    struct Output {
        let nameFieldEmpty: Driver<Bool>
        let startButtonTapped: Driver<Void>
    }
    
    private let coordinator: Coordinator
    private let realmManager: RealmManager
    private let dateService: DateServiceProtocol
    private let disposeBag = DisposeBag()
    
    
    init(coordinator: Coordinator,
         realmManager: RealmManager,
         dateService: DateServiceProtocol) {
        
        self.coordinator = coordinator
        self.realmManager = realmManager
        self.dateService = dateService
    }
    
    func transform(input: Input) -> Output {
        
        let nameFieldIsEmpty = input.nameFieldText
            .withLatestFrom(input.nameFieldText)
            .map { $0.isEmpty }
        
        let startButtonTapped = input.startButtonTap
            .withLatestFrom(input.nameFieldText)
            .map { [realmManager, coordinator] nameFieldText in
                if !nameFieldText.isEmpty {
                    realmManager.setupClient(with: nameFieldText)
                    coordinator.goMain()
                }
            }
        
        return Output(nameFieldEmpty: nameFieldIsEmpty,
                      startButtonTapped: startButtonTapped)
    }
}

