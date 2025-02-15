//
//  AbstractDesignPattern2.swift
//  Design Pattern
//
//  Created by Hirendra Sharma on 13/02/25.
//

extension ViewController {
    
    func abstractPatternExample2() {
        let theme = ThemeManager.getFactory(theme: "dark")
        print(theme)
    }
    
}

protocol Button {
    func render() -> String
}

protocol Label {
    func render() -> String
}

class LightButton: Button {
    func render() -> String {
        return "Light button"
    }
}

class DarkButton: Button {
    func render() -> String {
        return "Dark Button"
    }
}

class LightLabel: Label {
    func render() -> String {
        return "Light Label"
    }
}

class DarkLabel: Label {
    func render() -> String {
        return "Dark Label"
    }
}

protocol UIComponentFactory {
    func createButton() -> Button
    func createLabel() -> Label
}

class LightThemeFactory: UIComponentFactory {
    func createButton() -> any Button {
        return LightButton()
    }
    
    func createLabel() -> any Label {
        return LightLabel()
    }
}

class DarkThemeFactory: UIComponentFactory {
    func createLabel() -> any Label {
        return DarkLabel()
    }
    
    func createButton() -> any Button {
        return DarkButton()
    }
}

class ThemeManager {
    static func getFactory(theme: String) -> UIComponentFactory {
        switch theme {
        case "dark":
            return DarkThemeFactory()
        default:
            return LightThemeFactory()
        }
    }
}
