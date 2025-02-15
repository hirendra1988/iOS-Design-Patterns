//
//  FactoryDesignPattern.swift
//  Design Pattern
//
//  Created by Hirendra Sharma on 12/02/25.
//

import Foundation
import UIKit

extension ViewController {
    
    // Here Without the Factory Pattern, the code directly creates instances of specific Button classes:
    func factoryPatternBadUseCase() {
        //Instantiate directly
        let primaryButton = PrimaryButton()
        let secondaryButton = SecondaryButton()
        print(primaryButton)
        print(secondaryButton)
    }
    
    //Using the Factory Pattern, the creation logic is moved into a factory class:
    func factoryPatternExample1() {
        //Usage with Factory Pattern
        let primaryButton = ButtonFactory.createButton(type: .primary)
        let secondaryButton = ButtonFactory.createButton(type: .secondary)
        print(primaryButton)
        print(secondaryButton)
    }
    
}

protocol ButtonProtocol {
    func configure() -> UIButton
}

class PrimaryButton: ButtonProtocol {
    func configure() -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle("Primary", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }
}

class SecondaryButton: ButtonProtocol {
    func configure() -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle("Secondary", for: .normal)
        button.backgroundColor = .gray
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }
}

enum ButtonType {
    case primary
    case secondary
}

class ButtonFactory {
    static func createButton(type: ButtonType) -> ButtonProtocol {
        switch type {
        case .primary:
            return PrimaryButton()
        case .secondary:
            return SecondaryButton()
        }
    }
}
