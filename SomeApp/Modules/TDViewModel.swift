//
//  TDViewModel.swift
//
//  Created by Steellson.
//

import Foundation
import RxCocoa
import RxSwift

protocol TDViewModelProtocol {
    
    typealias Input = (
        text: Driver<String>,
        startTap: Driver<Void>
    )
    
    typealias Output = (
        isEmpty: Driver<Bool>,
        start: Driver<Void>
    )
    
    typealias ViewModelBuilder = (TDViewModelProtocol.Input) -> TDViewModelProtocol
    
    var input: TDViewModelProtocol.Input { get }
    var output: TDViewModelProtocol.Output { get }
    
    static func transform(input: TDViewModelProtocol.Input) -> TDViewModelProtocol.Output
}


final class TDViewModel: TDViewModelProtocol {
    
    private let realmManager: RealmManager = RealmManager()
    private let dateService: DateServiceProtocol = DateService()
    private let disposeBag = DisposeBag()
    
    var input: (text: Driver<String>, startTap: Driver<Void>)
    var output: (isEmpty: Driver<Bool>, start: Driver<Void>)
    
    init(input: (text: Driver<String>,
                 startTap: Driver<Void>)) {
        
        self.input = input
        self.output = TDViewModel.transform(input: (text: input.text,
                                                    startTap: input.startTap))
    }
    
    static func transform(input: TDViewModelProtocol.Input) -> TDViewModelProtocol.Output {
        
        let isEmpty = input.text
            .withLatestFrom(input.text)
            .map { !$0.isEmpty }
        
        let start = input.startTap
            .withLatestFrom(input.text)
            .map { text in
                print(text)
//                if !text.isEmpty {
//                    realmManager.setupClient(with: text)
//                }
            }

        return Output(isEmpty: isEmpty, start: start)
    }
}

