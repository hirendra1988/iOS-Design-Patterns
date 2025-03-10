//
//  DecoratorDesignPattern.swift
//  Design Pattern
//
//  Created by Hirendra Sharma on 16/02/25.
//

//Step 5: Usage Example

extension ViewController {
    
    func decoratorDesignPattern() {
        let coffee = SimpleCoffee()
        print("\(coffee.description()) - $\(coffee.cost())")
        // Output: Simple Coffee - $5.0

        let milkCoffee = MilkDecorator(coffee)
        print("\(milkCoffee.description()) - $\(milkCoffee.cost())")
        // Output: Simple Coffee, Milk - $6.5

        let sugarMilkCoffee = SugarDecorator(milkCoffee)
        print("\(sugarMilkCoffee.description()) - $\(sugarMilkCoffee.cost())")
        // Output: Simple Coffee, Milk, Sugar - $7.0
    }
    
}

//Step 1: Define a Base Protocol
protocol Coffee {
    func cost() -> Double
    func description() -> String
}

//Step 2: Create a Concrete Component
class SimpleCoffee: Coffee {
    func cost() -> Double {
        return 5.0
    }
    
    func description() -> String {
        return "Simple Coffee"
    }
}

//Step 3: Create an Abstract Decorator
class CoffeeDecorator: Coffee {
    private let decoratedCoffee: Coffee

    init(_ coffee: Coffee) {
        self.decoratedCoffee = coffee
    }
    
    func cost() -> Double {
        return decoratedCoffee.cost()
    }
    
    func description() -> String {
        return decoratedCoffee.description()
    }
}

//Step 4: Create Concrete Decorators
//Milk Decorator
class MilkDecorator: CoffeeDecorator {
    override func cost() -> Double {
        return super.cost() + 1.5
    }
    
    override func description() -> String {
        return super.description() + ", Milk"
    }
}

//Sugar Decorator
class SugarDecorator: CoffeeDecorator {
    override func cost() -> Double {
        return super.cost() + 0.5
    }
    
    override func description() -> String {
        return super.description() + ", Sugar"
    }
}

