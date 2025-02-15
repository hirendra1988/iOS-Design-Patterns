//
//  BuilderDesignPattern1.swift
//  Design Pattern
//
//  Created by Hirendra Sharma on 12/02/25.
//

extension ViewController {
    func builderPatternExample1() {
        let user = User.UserBuilder(name: "Test")
            .setAge(20)
            .setEmail("abc@test.com")
            .setPhone(1234567890)
            .build()
        
        print(user)
    }
}

struct User {
    let name: String
    let age: Int?
    let email: String?
    let phone: Int?
    
    // Private initializer to enforce object creation via builder
    private init(builder: UserBuilder) {
        self.name = builder.name
        self.age = builder.age
        self.email = builder.email
        self.phone = builder.phone
    }
    
    // Nested Builder Class
    class UserBuilder {
        var name: String
        var age: Int?
        var email: String?
        var phone: Int?
        
        init(name: String) {
            self.name = name
        }
        
        func setAge(_ age: Int) -> UserBuilder {
            self.age = age
            return self
        }
        
        func setEmail(_ email: String) -> UserBuilder {
            self.email = email
            return self
        }
        
        func setPhone(_ phone: Int) -> UserBuilder {
            self.phone = phone
            return self
        }
        
        func build() -> User {
            return User(builder: self)
        }
    }
}

