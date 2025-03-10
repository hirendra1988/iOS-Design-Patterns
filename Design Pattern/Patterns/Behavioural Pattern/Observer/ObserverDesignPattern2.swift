//
//  ObserverDesignPattern2.swift
//  Design Pattern
//
//  Created by Hirendra Sharma on 16/02/25.
//

// Using Combine

//🔹 Step 1: Define the Observable Product
//We use @Published to notify subscribers when the product becomes available.

import Combine

class Product45 {
    @Published var isAvailable: Bool = false
    let name: String

    init(name: String) {
        self.name = name
    }
}

//@Published automatically generates a publisher for isAvailable.
//When isAvailable changes, Combine notifies all subscribers.

//🔹 Step 2: Define the Observer (User)
//Each user subscribes to product availability changes.

class User45 {
    var name: String
    private var cancellable: AnyCancellable?

    init(name: String) {
        self.name = name
    }

    func subscribe(to product: Product45) {
        cancellable = product.$isAvailable
            .filter { $0 } // Only notify when available
            .sink { _ in
                print("🔔 \(self.name) received notification: 📢 \(product.name) is now available!")
            }
    }
}

//sink {} subscribes to Product updates.
//filter { $0 } ensures users only get notified when available.

// Step 3: Example Usage

extension ViewController {
    
    func observerDesignPattern2() {
        // Create a product
        let macbook = Product45(name: "MacBook Pro 16\"")

        // Create users
        let alice = User45(name: "Alice")
        let bob = User45(name: "Bob")

        // Users subscribe to the product
        alice.subscribe(to: macbook)
        bob.subscribe(to: macbook)

        // Product becomes available → Notifies all subscribers
        macbook.isAvailable = true

        // Output:
        // 🔔 Alice received notification: 📢 MacBook Pro 16" is now available!
        // 🔔 Bob received notification: 📢 MacBook Pro 16" is now available!

    }
    
}
