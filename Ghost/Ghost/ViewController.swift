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
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

// Game test variables and function. Tested in Playground, worked properly.
// Calling test function in viewcontroller gives errors.
var dictionary = ["bal", "luchtballon", "baas", "balkon", "handbal"]

let dict = Dictionary(words: dictionary)

let game = Game(dictionary: dict)

func testGame(dict: Dictionary, game: Game, input: String) {
    
    game.guess(input)
    
    if game.ended() == true {
        
        println("Player one wins: \(game.winner())")
        
        if dict.count() == 1 {
            
            println("Remaining word: \(dict.result())")
        }
    }
    
    game.turn()
}

// gives errors in viewcontroller
testGame(dict, game, "b")

testGame(dict, game, "a")

testGame(dict, game, "a")

