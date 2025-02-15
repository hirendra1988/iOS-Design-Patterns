//
//  PrototypeDesignPattern.swift
//  Design Pattern
//
//  Created by Hirendra Sharma on 14/02/25.
//

import Foundation

extension ViewController {
    
    func PrototypePattern() {
        let bmw = Car(brand: "BMW", model: "2020", engine: Engine(horsepower: 1200))
        let audi = bmw.copy() as! Car
        audi.engine.horsepower = 2000
        print(bmw.engine.horsepower)
        print(audi.engine.horsepower)
    }
    
}

class Car: NSCopying {
    var brand: String
    var model: String
    var engine: Engine
    
    init(brand: String, model: String, engine: Engine) {
        self.brand = brand
        self.model = model
        self.engine = engine
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return Car(brand: brand, model: model, engine: engine.copy())
    }
}

class Engine {
    var horsepower: Int
    init(horsepower: Int) {
        self.horsepower = horsepower
    }
    
    func copy() -> Engine {
        return Engine(horsepower: horsepower)
    }
}
