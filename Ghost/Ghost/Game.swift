//
//  Game.swift
//  Ghost
//
//  Created by Elias Gorter on 19-04-15.
//  Copyright (c) 2015 EliasGorter6052274. All rights reserved.
//
// Game class implements game rules of the game Ghost.

import Foundation

class Game {
    
    // Game variables, player one starts game.
    var dictionary: Dictionary
    var currentWord: String
    var playerIsPLayer1: Bool
    var gameHasEnded: Bool
    
    init(dictionary: Dictionary) {
        
        self.dictionary = dictionary
        self.currentWord = ""
        self.playerIsPLayer1 = true
        self.gameHasEnded = false
    }
    
    // Appends input letter to game word, filters dictionary with game word.
    func guess(input: String) {
        currentWord += input
        dictionary.filter(currentWord)
    }
    
    // Switches player, returns whose turn it is.
    func turn() -> Bool {
        self.playerIsPLayer1 = !self.playerIsPLayer1
        return self.playerIsPLayer1
    }
    
    // Checks if end game condition is met.
    func ended() -> Bool {
        if dictionary.count() == 0  || count(currentWord) > 3 &&
            contains(dictionary.words, currentWord)
        {
            gameHasEnded = true
        }
        return gameHasEnded
    }
    
    // Returns winner, being the opposite player of who triggered an end game.
    func winner() -> Bool {
        return self.turn()
    }
}