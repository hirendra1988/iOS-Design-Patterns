//
//  AbstractDesignPattern1.swift
//  Design Pattern
//
//  Created by Hirendra Sharma on 13/02/25.
//

extension ViewController {
    
    func abstractPatternExample() {
        let console = ConsoleLoggerFactory()
        logMessage(factory: console, message: "This is a console log.")
        
        let fileLog = FileLoggerFactory()
        logMessage(factory: fileLog, message: "This is a file log.")
    }
    
    func logMessage(factory: LoggerFactory, message: String) {
        let logger = factory.createLogger()
        logger.log(message: message)
    }
    
}

// Abstract Product
protocol Logger {
    func log(message: String)
}

// Concrete Product
class ConsoleLogger: Logger {
    func log(message: String) {
        print("Console Log: \(message)")
    }
}

class FileLogger: Logger {
    func log(message: String) {
        print("File Log: \(message)")
    }
}

// Abstract Factory
protocol LoggerFactory {
    func createLogger() -> Logger
}

class ConsoleLoggerFactory: LoggerFactory {
    func createLogger() -> Logger {
        return ConsoleLogger()
    }
}

class FileLoggerFactory: LoggerFactory {
    func createLogger() -> Logger {
        return FileLogger()
    }
}
