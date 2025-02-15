//
//  FacadeAndStrategyPattern.swift
//  Design Pattern
//
//  Created by Hirendra Sharma on 15/02/25.
//

//Step 1: Define an Analytics Protocol (Strategy Pattern)
protocol AnalyticsService {
    func logEvent(name: String, parameters: [String: Any]?)
    func trackScreen(screenName: String)
    func setUserProperty(key: String, value: String)
    func identifyUser(userID: String)
}

//Step 2: Implement Different Analytics Providers
//import FirebaseAnalytics

class FirebaseAnalyticsService: AnalyticsService {
    func logEvent(name: String, parameters: [String: Any]?) {
        Analytics.logEvent(name, parameters: parameters)
    }
    
    func trackScreen(screenName: String) {
        logEvent(name: "screen_view", parameters: ["screen_name": screenName])
    }
    
    func setUserProperty(key: String, value: String) {
        Analytics.setUserProperty(value, forName: key)
    }
    
    func identifyUser(userID: String) {
        // Firebase does not explicitly require user identification
    }
}

class GoogleAnalyticsService: AnalyticsService {
    func logEvent(name: String, parameters: [String: Any]?) {
        GoogleAnalytics.logEvent(name, parameters: parameters)
    }
    
    func trackScreen(screenName: String) {
        logEvent(name: "screen_view", parameters: ["screen_name": screenName])
    }
    
    func setUserProperty(key: String, value: String) {
        GoogleAnalytics.setUserProperty(value, forName: key)
    }
    
    func identifyUser(userID: String) {
        // Firebase does not explicitly require user identification
    }
}

//Step 3: Create the Analytics Facade
class AnalyticsFacade {
    private var analyticsServices: [AnalyticsService]
    
    init(services: [AnalyticsService]) {
        self.analyticsServices = services
    }
    
    func logEvent(name: String, parameters: [String: Any]? = nil) {
        for service in analyticsServices {
            service.logEvent(name: name, parameters: parameters)
        }
    }
    
    func trackScreen(screenName: String) {
        for service in analyticsServices {
            service.trackScreen(screenName: screenName)
        }
    }
    
    func setUserProperty(key: String, value: String) {
        for service in analyticsServices {
            service.setUserProperty(key: key, value: value)
        }
    }
    
    func identifyUser(userID: String) {
        for service in analyticsServices {
            service.identifyUser(userID: userID)
        }
    }
}


//Step 4: Use the Facade in Your App
extension ViewController {
    
    func FacadeAndStrategyDesignPattern() {
        let analytics = AnalyticsFacade(services: [FirebaseAnalyticsService(), GoogleAnalyticsService()])
        
        // Log an event
        analytics.logEvent(name: "button_clicked", parameters: ["button_name": "SignUp"])
        
        // Track screen views
        analytics.trackScreen(screenName: "HomeScreen")
        
        // Set user properties
        analytics.setUserProperty(key: "subscription", value: "Premium")
        
        // Identify a user
        analytics.identifyUser(userID: "user_12345")
    }
    
}


// This is FirebaseAnalytics class, just create for dummy purpose
class Analytics {
    static func logEvent(_ name: String, parameters: [String: Any]?) {
        
    }
    
    static func setUserProperty(_ value: String, forName: String) {
        
    }
}

// This is GoogleAnalytics class, just create for dummy purpose
class GoogleAnalytics {
    static func logEvent(_ name: String, parameters: [String: Any]?) {
        
    }
    
    static func setUserProperty(_ value: String, forName: String) {
        
    }
}
