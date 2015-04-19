//
//  Game.swift
//  Ghost
//
//  Created by Elias Gorter on 19-04-15.
//  Copyright (c) 2015 EliasGorter6052274. All rights reserved.
//

import Foundation

class Game {
    
    var dictionary: Dictionary
    var currentWordTyped: String
    var currentPlayerIsPLayerOne: Bool
    var gameHasEnded: Bool
    
    init(dictionary: Dictionary) {
        
        self.dictionary = dictionary
        self.currentWordTyped = ""
        self.currentPlayerIsPLayerOne = true
        self.gameHasEnded = false
    }
    
    func guess(input: String) {
        
        currentWordTyped += input
        dictionary.filter(currentWordTyped)
    }
    
    func turn() -> Bool {
        
        return self.currentPlayerIsPLayerOne
    }
    
    func ended() -> Bool {
        
        if dictionary.count() == 1 || dictionary.count() == 0 {
            
            self.gameHasEnded = true
            return self.gameHasEnded
        }
        else {
            
            return self.gameHasEnded
        }
    }
    
    func winner() -> Bool {
        
        return self.currentPlayerIsPLayerOne
    }
}