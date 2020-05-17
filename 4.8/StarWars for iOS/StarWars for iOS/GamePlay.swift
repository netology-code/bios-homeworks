//
//  GamePlay.swift
//  StarWars
//
//  Created by Aleksey Rochev (Netology) on 19.11.2019.
//  Copyright © 2019 Aleksey Rochev (Netology). All rights reserved.
//

import Foundation

class GamePlay {
    
    //MARK: - Properties
    
    private let space = Space()
    
    func play() {
        print("Давным давно в далекой галактике")
        
        let deathStarPoint = Point.generate()
        let deathStar = DeathStar(coordinate: deathStarPoint)
        deathStar.shootHandler = space
        space.add(object: deathStar)
        
        let xWingPoint = Point.generate()
        let xWing = XWing(coordinate: xWingPoint)
        xWing.shootHandler = space
        space.add(object: xWing)
        
        var radarPoint = Point.generate()
        
        let radarJedi = Radar(coordinate: radarPoint)
        radarJedi.datasource = space
        radarJedi.observer = xWing
        radarJedi.toggle()
        space.add(object: radarJedi)
        
        radarPoint = Point.generate()
        let radarEmpire = Radar(coordinate: radarPoint)
        radarEmpire.datasource = space
        radarEmpire.observer = xWing
        radarEmpire.toggle()
        space.add(object: radarEmpire)
    }
    
    deinit {
        print("Game Over")
    }
}
