//
//  ViewController.swift
//  Ghost
//
//  Created by Elias Gorter on 16-04-15.
//  Copyright (c) 2015 EliasGorter6052274. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        var dictionary = "bal\nballen\nballon\nluchtballon\nbalkon\nhandbal"
        
        let dict = Dictionary(words: dictionary)
        
        let game = Game(dictionary: dict)
        
        func testGame(dict: Dictionary, game: Game, input: String) {
            
            game.guess(input)
            
            if game.ended() == true {
                
                println("Player one wins: \(game.winner())")
                
                println("Remaining word: \(game.currentWordTyped)")
            }
            
            game.turn()
        }
        
        testGame(dict, game, "b")
        
        testGame(dict, game, "a")
        
        testGame(dict, game, "l")
        
        testGame(dict, game, "l")
        
        testGame(dict, game, "e")
        
        testGame(dict, game, "n")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



