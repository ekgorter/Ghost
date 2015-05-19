//
//  GameViewController.swift
//  Ghost
//
//  Created by Elias Gorter on 20-04-15.
//  Copyright (c) 2015 EliasGorter6052274. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UITextFieldDelegate {
    
    var gameInProgress: Bool = false
    var currentTurn: Bool! = true
    var currentWord: String! = ""

    var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    var path: String! = "path to dictionary"
    var dictionary: String! = "contents of dictionary"
    var dict: Dictionary = Dictionary(words: "dictionary")
    var game: Game = Game(dictionary: Dictionary(words: "dictionary"))
    
    var player1Name = ""
    var player2Name = ""
    var winner: String!
    var highscores: [String: Int]!
 
    @IBOutlet weak var playerOneLabel: UILabel!
    
    @IBOutlet weak var playerTwoLabel: UILabel!
    
    @IBOutlet weak var wordDisplayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaults = NSUserDefaults.standardUserDefaults()
        path = selected_dictionary(defaults)
        dictionary = String(contentsOfFile: path!, encoding: NSUTF8StringEncoding, error: nil)!
        dict = Dictionary(words: dictionary)
        game = Game(dictionary: dict)
                
        playerOneLabel.text = player1Name
        playerTwoLabel.text = player2Name
        playerTwoLabel.hidden = true
        
        game.currentWordTyped = currentWord
        wordDisplayLabel.text = game.currentWordTyped
        
        if currentTurn == false {
            game.turn()
            switch_player_label(playerOneLabel, player2: playerTwoLabel)
        }
        
        
        if let scores = defaults.objectForKey("highscores") as? [String: Int] {
            highscores = scores
        } else {
            highscores = [:]
        }
        letterInputTextField.delegate = self
    }
    
    // Hides navigation bar in game screen.
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
    }

    @IBOutlet weak var letterInputTextField: UITextField!
    
    // Allows no more than one character to be entered in text field.
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 1
        return count(textField.text) + (count(string) - range.length) <= maxLength
    }
    
    // When "add" button is pressed:
    @IBAction func addLetterButton(sender: AnyObject) {
        if gameInProgress == false {
            gameInProgress = true
            defaults.setBool(gameInProgress, forKey: "gameInProgress")
        }

        // Input in textfield is sent to game class.
        game.guess((letterInputTextField.text).lowercaseString)
        // Label displaying typed letters is updated.
        wordDisplayLabel.text! = game.currentWordTyped
        // Clear text field input.
        letterInputTextField.text = ""
        
        if game.ended() {
            gameInProgress = false
            defaults.setBool(gameInProgress, forKey: "gameInProgress")
            if game.winner() {
                end_game(playerOneLabel, sender: sender)
            } else {
                end_game(playerTwoLabel, sender: sender)
            }
        }
        // The turn passes to the next player.
        currentTurn = game.turn()
        // Hides the player name whose turn is over and shows the player whose turn it is.
        switch_player_label(playerOneLabel, player2: playerTwoLabel)
        
        // Saves current state of game.
        defaults.setObject(player1Name, forKey: "player1")
        defaults.setObject(player2Name, forKey: "player2")
        defaults.setObject(game.currentWordTyped, forKey: "currentWord")
        defaults.setBool(currentTurn, forKey: "playerTurn")
    }
    
    // Swaps which of the player labels is hidden or shown.
    func switch_player_label(player1: UILabel, player2: UILabel) {
        let temp = player1.hidden
        player1.hidden = player2.hidden
        player2.hidden = temp
    }
    
    // Updates highscore and performs segue to win screen.
    func end_game (winningPlayer: UILabel, sender: AnyObject) {
        if let winnerExists = highscores[winningPlayer.text!] {
            highscores[winningPlayer.text!]! += 1
            defaults.setObject(self.highscores, forKey: "highscores")
        }
        winner = winningPlayer.text!
        performSegueWithIdentifier("winSegue", sender: sender)
    }
    
    // Selects dictionary based on settings in settings screen.
    func selected_dictionary(defaults: NSUserDefaults) -> String? {
        var dutch = NSBundle.mainBundle().pathForResource("dutch", ofType:"txt")
        var english = NSBundle.mainBundle().pathForResource("english", ofType:"txt")
        
        switch defaults.integerForKey("language") {
        case 0:
            return dutch
        case 1:
            return english
        default:
            return dutch
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "winSegue" {
            let vc = segue.destinationViewController as! WinViewController
            vc.winner = winner
            vc.word = wordDisplayLabel.text!
        }
    }
}
