//
//  StrategyDesignPattern.swift
//  Design Pattern
//
//  Created by Hirendra Sharma on 15/02/25.
//

//https://medium.com/@JuanpeCatalan/strategy-pattern-in-swift-1462dbddd9fe
extension ViewController {
    
    func strategyDesignPattern() {
        // 5️⃣ Usage Example
        let paymentContext = PaymentContext(strategy: CreditCardPayment())
        paymentContext.makePayment(amount: 100.0)

        // Switch strategy dynamically
        paymentContext.setStrategy(PayPalPayment())
        paymentContext.makePayment(amount: 50.0)

        paymentContext.setStrategy(UPIPayment())
        paymentContext.makePayment(amount: 75.0)
    }
    
}

//Step 1: Define the Strategy Protocol
protocol PaymentStrategy {
    func pay(amount: Double)
}

// Step 2: Default Implementation (Optional)
extension PaymentStrategy {
    func pay(amount: Double) {
        print("Processing payment of $\(amount)")
    }
}

//Step 3: Implement Concrete Strategies
final class CreditCardPayment: PaymentStrategy {
    func pay(amount: Double) {
        print("Paid $\(amount) using Credit Card.")
    }
}

final class PayPalPayment: PaymentStrategy {
    func pay(amount: Double) {
        print("Paid $\(amount) using PayPal.")
    }
}

final class UPIPayment: PaymentStrategy {
    func pay(amount: Double) {
        print("Paid $\(amount) using UPI.")
    }
}

//Step 4: Create a Context Class
final class PaymentContext {
    private var paymentStrategy: PaymentStrategy
    
    init(strategy: PaymentStrategy) {
        self.paymentStrategy = strategy
    }
    
    func setStrategy(_ strategy: PaymentStrategy) {
        self.paymentStrategy = strategy
    }
    
    func makePayment(amount: Double) {
        paymentStrategy.pay(amount: amount)
    }
}
