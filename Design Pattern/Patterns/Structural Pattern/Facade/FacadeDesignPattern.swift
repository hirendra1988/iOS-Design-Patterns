//
//  FacadeDesignPattern.swift
//  Design Pattern
//
//  Created by Hirendra Sharma on 15/02/25.
//

//Example: Implementing Facade Pattern in iOS (Swift)
//Let’s consider a Home Automation System that includes Lights, Air Conditioner, and Music System. Instead of exposing the complexity of these systems, we create a single HomeFacade class.

extension ViewController {
    
    func facadeDesignPattern() {
        // Default usage
        let homeFacade = HomeFacade()
        homeFacade.startPartyMode() // Turns on lights, AC, and starts music
        homeFacade.stopPartyMode() // Turns off everything
        
        // Custom usage (Dependency Injection)
        let customHomeFacade = HomeFacade(light: Light(),
                                          ac: AirConditioner(),
                                          music: MusicSystem())
        customHomeFacade.startPartyMode()
        homeFacade.stopPartyMode() // Turns off everything
    }
    
}

//Step 1: Subsystems
class Light {
    func turnOn() {
        print("Lights are ON")
    }
    
    func turnOff() {
        print("Lights are OFF")
    }
}

class AirConditioner {
    func turnOn() {
        print("Air Conditioner is ON")
    }
    
    func turnOff() {
        print("Air Conditioner is OFF")
    }
}

class MusicSystem {
    func playMusic() {
        print("Music System is PLAYING")
    }
    
    func stopMusic() {
        print("Music System is STOPPED")
    }
}

//Step 2: Facade Class
class HomeFacade {
    private let light: Light
    private let ac: AirConditioner
    private let music: MusicSystem

    init(light: Light = Light(),
         ac: AirConditioner = AirConditioner(),
         music: MusicSystem = MusicSystem()) {
        self.light = light
        self.ac = ac
        self.music = music
    }

    func startPartyMode() {
        print("Starting Party Mode...")
        light.turnOn()
        ac.turnOn()
        music.playMusic()
    }

    func stopPartyMode() {
        print("Stopping Party Mode...")
        light.turnOff()
        ac.turnOff()
        music.stopMusic()
    }
}

