//
//  FactoryDesignPattern.swift
//  Design Pattern
//
//  Created by Hirendra Sharma on 12/02/25.
//

import Foundation
import UIKit

//✅ This implementation follows all five SOLID principles effectively! 🎯🔥
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
        
        //3. Liskov Substitution Principle (LSP) ✅
        //All button types implement the ButtonProtocol protocol.
        //A UIButton object can be retrieved from any button type, and they all work interchangeably.


        let primaryButton = ButtonFactory.createButton(type: .primary)
        let secondaryButton = ButtonFactory.createButton(type: .secondary)
        print(primaryButton)
        print(secondaryButton)
        
        //5. Dependency Inversion Principle (DIP) ✅
        //The factory and ViewController work with the ButtonProtocol protocol, not specific classes like PrimaryButton or SecondaryButton.

    }
    
}

//4. Interface Segregation Principle (ISP) ✅
protocol ButtonProtocol {
    func configure() -> UIButton
}

//1. Single Responsibility Principle (SRP) ✅
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

//1. Single Responsibility Principle (SRP) ✅
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

//2. Open-Closed Principle (OCP) ✅
//If we need to add a new button type (e.g., OutlineButton), we can create a new class without modifying existing code.

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
