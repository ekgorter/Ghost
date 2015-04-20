//
//  Game.swift
//  Ghost
//
//  Created by Elias Gorter on 19-04-15.
//  Copyright (c) 2015 EliasGorter6052274. All rights reserved.
//

import Foundation

class Game {
    
    // Game variables, player one starts game.
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
    
    // Appends input letter to game word, filters dictionary with game word.
    func guess(input: String) {
        
        currentWordTyped += input
        dictionary.filter(currentWordTyped)
    }
    
    // Switches player, returns whose turn it is.
    func turn() -> Bool {
        
        self.currentPlayerIsPLayerOne = !self.currentPlayerIsPLayerOne
        return self.currentPlayerIsPLayerOne
    }
    
    // Checks if end game condition is met.
    func ended() -> Bool {
        
        // If no words remain.
        if dictionary.count() == 0 {
            
            self.gameHasEnded = true
            return self.gameHasEnded
        }
        // If an exact match is found for a word longer than 3 letters.
        else if count(self.currentWordTyped) > 3 {
            
            if contains(dictionary.words, self.currentWordTyped) {
               
                self.gameHasEnded = true
                return self.gameHasEnded
            } else {
                
                return self.gameHasEnded
            }
        } else {
            
            return self.gameHasEnded
        }
    }
    
    // Returns winner, being the opposite player of who triggered an end game.
    func winner() -> Bool {

        return self.turn()
    }
}