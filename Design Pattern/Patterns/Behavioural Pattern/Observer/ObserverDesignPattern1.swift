//
//  ObserverDesignPattern.swift
//  Design Pattern
//
//  Created by Hirendra Sharma on 16/02/25.
//

//🚀 Low-Level Design (LLD) for Notify Me
//📝 Problem Statement
//Design a system where users can subscribe to receive notifications for product availability, price drops, or other events. The system should notify all subscribed users when an event occurs.

//1️⃣ Define the Observer Protocol
protocol Observer: AnyObject {
    func notify(message: String)
}
//Any observer (e.g., a User) must implement this protocol to receive updates.

//2️⃣ Create the Subject (Observable)
class Product {
    private var observers = [Observer]()
    var name: String
    var isAvailable: Bool = false {
        didSet {
            if isAvailable {
                notifyObservers()
            }
        }
    }

    init(name: String) {
        self.name = name
    }

    func addObserver(_ observer: Observer) {
        observers.append(observer)
    }

    func removeObserver(_ observer: Observer) {
        observers.removeAll { $0 === observer }
    }

    private func notifyObservers() {
        for observer in observers {
            observer.notify(message: "📢 \(name) is now available!")
        }
    }
}
//Observers register to the product.
//When the product becomes available, all observers are notified.

//3️⃣ Create the Observer (User)
class User12: Observer {
    var name: String

    init(name: String) {
        self.name = name
    }

    func notify(message: String) {
        print("🔔 \(name) received notification: \(message)")
    }
}
//Users implement the Observer protocol to receive updates.

//4️⃣ Example Usage

extension ViewController {
    
    func observerDesignPattern1() {
        // Create a product
        let iphone = Product(name: "iPhone 15 Pro")

        // Create users
        let user1 = User12(name: "Alice")
        let user2 = User12(name: "Bob")

        // Users subscribe to the product
        iphone.addObserver(user1)
        iphone.addObserver(user2)

        // Product becomes available → Notifies all users
        iphone.isAvailable = true

        // Output:
        // 🔔 Alice received notification: 📢 iPhone 15 Pro is now available!
        // 🔔 Bob received notification: 📢 iPhone 15 Pro is now available!
    }
    
}
