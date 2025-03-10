//
//  BuilderDesignPattern2.swift
//  Design Pattern
//
//  Created by Hirendra Sharma on 12/02/25.
//

//✅ This implementation follows below SOLID principles effectively! 🎯🔥
//1. Single Responsibility Principle (SRP) ✅
//Pizza: Responsible for holding pizza data (size, toppings).
//PizzaBulder: Responsible for constructing a pizza.
//ViewController simply uses the builder.

//2. Open-Closed Principle (OCP) ✅
//We can add new methods in PizzaBulder (e.g., addOlives()) without modifying existing methods.
//Pizza doesn’t need changes when we add new toppings.

//4. Interface Segregation Principle (ISP) ✅
//PizzaBulder provides only necessary methods (addCheese(), addMushroom()).
//If a pizza does not need pepperoni, we simply don’t call addPepperoni().


extension ViewController {
    
    func builderPatternExample2() {
        let pizza = Pizza.PizzaBuilder(size: "Medium")
            .addCheese()
            .addOlives()
            .build()
        
        print(pizza)
    }
    
}

struct Pizza {
    let size: String
    let cheese: Bool
    let pepperoni: Bool
    let mushrooms: Bool
    let olives: Bool
    
    private init(builder: PizzaBuilder) {
        self.size = builder.size
        self.cheese = builder.cheese
        self.pepperoni = builder.pepperoni
        self.mushrooms = builder.mushrooms
        self.olives = builder.olives
    }
    
    class PizzaBuilder {
        var size: String
        var cheese: Bool = false
        var pepperoni: Bool = false
        var mushrooms: Bool = false
        var olives: Bool = false
        
        init(size: String) {
            self.size = size
        }
        
        func addCheese() -> PizzaBuilder {
            self.cheese = true
            return self
        }
        
        func addPepperoni() -> PizzaBuilder {
            self.pepperoni = true
            return self
        }
        
        func addMushrooms() -> PizzaBuilder {
            self.mushrooms = true
            return self
        }
        
        func addOlives() -> PizzaBuilder {
            self.olives = true
            return self
        }
        
        func build() -> Pizza {
            return Pizza(builder: self)
        }
    }
}
