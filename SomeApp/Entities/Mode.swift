//
//  Mode.swift
//
//  Created by Steellson
//

import UIKit

protocol ModeProtocol: AnyObject {
    var name: String { get }
    var isOn: Bool { get set }
    
    func switchState()
}

final class Mode: ModeProtocol {
    
    var name: String
    var isOn: Bool
    
    init(name: String, isOn: Bool) {
        self.name = name
        self.isOn = isOn
    }
    
    func switchState() {
        self.isOn.toggle()
    }
}

