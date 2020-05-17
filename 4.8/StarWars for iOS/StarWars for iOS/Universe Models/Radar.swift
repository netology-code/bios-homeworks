//
//  SpaceObserver.swift
//  StarWars
//
//  Created by Aleksey Rochev (Netology) on 19.11.2019.
//  Copyright © 2019 Aleksey Rochev (Netology). All rights reserved.
//

import Foundation

protocol RadarObserver: AnyObject {
    func detected(object: SpaceObject)
}

protocol Togglable {
    mutating func toggle()
}

class Radar: SpaceObject, Togglable {
    
    // MARK: - Constants
    
    private enum  Constants {
        static let timeInterval: TimeInterval = 0.2
    }
    
    private enum Status: Togglable {
        case on
        case off
        
        mutating func toggle() {
            switch self {
            case .off:
                self = .on
            case .on:
                self = .off
            }
        }
    }
    
    // MARK: - Properties
    
    var coordinate: Point
    var health: Int = 1
    
    weak var observer: RadarObserver?
    weak var datasource: Displayable?
    
    private var timer: Timer?
    private var status = Status.off {
        didSet {
            switch status {
            case .on:
                startTimer()
            case .off:
                stopTimer()
            }
        }
    }
        
    // MARK: Lifecycle
    
    init(coordinate: Point) {
        self.coordinate = coordinate
    }
    
    deinit {
        print("Radar is dead")
    }
    
    func toggle() {
        status.toggle()
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: Constants.timeInterval,
                                          target: self,
                                          selector: #selector(self.sendSignal),
                                          userInfo: nil,
                                          repeats: true)
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
        
    @objc
    private func sendSignal() {
        let rect = Rect.generate()
        print("Сканирую пространство \(rect)")
        if let objects = datasource?.expose(for: rect),
            !objects.isEmpty,
            let starship = objects.first as? StarshipImp
        {
            print("Ага! Попался \(objects)")
            
            switch starship.fraction {
            case .empare:
                observer?.detected(object: starship)
            case .jedi:
                print("Свои!")
            }
        }
    }
}
