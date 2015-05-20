//
//  GameViewController.swift
//  Ghost
//
//  Created by Elias Gorter on 20-04-15.
//  Copyright (c) 2015 EliasGorter6052274. All rights reserved.
//
// Controls the game view, where one round of Ghost can be played. 

import UIKit

class GameViewController: UIViewController, UITextFieldDelegate {
    
    var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    // Variables to contain current game status.
    var gameInProgress: Bool = false
    var currentTurn: Bool! = true
    var currentWord: String! = ""
    // Variables to contain required data for game session.
    var path: String! = "path to dictionary"
    var dictionary: String! = "contents of dictionary"
    var dict: Dictionary = Dictionary(words: "dictionary file")
    var game: Game = Game(dictionary: Dictionary(words: "dictionary"))
    // Variables for receiving segued player names.
    var player1Name = ""
    var player2Name = ""
    // Variables to contain data for when game is over.
    var winner: String!
    var winReason: String!
    var highscores: [String: Int]!
    // Characters allowed to be added to word by users.
    let allowedChars: String =
        "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

    // Labels displaying player names and current word formed.
    @IBOutlet weak var playerOneLabel: UILabel!
    @IBOutlet weak var playerTwoLabel: UILabel!
    @IBOutlet weak var wordDisplayLabel: UILabel!
    
    // Hides navigation bar in game screen.
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let scores = defaults.objectForKey("highscores") as? [String: Int] {
            highscores = scores
        } else {
            highscores = [:]
        }
        letterInputTextField.delegate = self
        // Sets up game with selected dictionary.
        path = selectedDictionary(defaults)
        dictionary = String(contentsOfFile: path!, encoding:
            NSUTF8StringEncoding, error: nil)!
        dict = Dictionary(words: dictionary)
        game = Game(dictionary: dict)
        // Sets up new game or uses NSUserDefaults values to resume game.
        playerOneLabel.text = player1Name
        playerTwoLabel.text = player2Name
        playerTwoLabel.hidden = true
        game.currentWord = currentWord
        wordDisplayLabel.text = game.currentWord
        if currentTurn == false {
            game.turn()
            switchPlayerLabel(playerOneLabel, player2: playerTwoLabel)
        }
    }
    
    // Text field where letters can be entered by user.
    @IBOutlet weak var letterInputTextField: UITextField!
    
    // Allows no more than one character to be entered in text field.
    func textField(textField: UITextField, shouldChangeCharactersInRange range:
        NSRange, replacementString string: String) -> Bool
    {
        let maxLength = 1
        return count(textField.text) + (count(string) - range.length) <=
            maxLength
    }
    
    // Performs actions required at end of player turn.
    @IBAction func addLetterButton(sender: AnyObject) {
        // Only allow letters to be added to word.
        if letterInputTextField.text == "" ||
            allowedChars.rangeOfString(letterInputTextField.text) == nil
        {
            return
        }
        // When first round is played, game is now considered to be in progress.
        if gameInProgress == false {
            gameInProgress = true
            defaults.setBool(gameInProgress, forKey: "gameInProgress")
        }
        // Input letter is added to word, textfield is cleared.
        game.guess((letterInputTextField.text).lowercaseString)
        wordDisplayLabel.text! = game.currentWord
        letterInputTextField.text = ""
        // Checks if game has ended, and determines winner if true.
        if game.ended() {
            gameInProgress = false
            defaults.setBool(gameInProgress, forKey: "gameInProgress")
            if game.winner() {
                endGame(playerOneLabel, sender: sender)
            } else {
                endGame(playerTwoLabel, sender: sender)
            }
        }
        // The turn passes to the next player.
        currentTurn = game.turn()
        switchPlayerLabel(playerOneLabel, player2: playerTwoLabel)
        // Saves current state of game.
        defaults.setObject(player1Name, forKey: "player1")
        defaults.setObject(player2Name, forKey: "player2")
        defaults.setObject(game.currentWord, forKey: "currentWord")
        defaults.setBool(currentTurn, forKey: "playerTurn")
    }
    
    // Swaps which of the player labels is hidden or shown.
    func switchPlayerLabel(player1: UILabel, player2: UILabel) {
        let temp = player1.hidden
        player1.hidden = player2.hidden
        player2.hidden = temp
    }
    
    // Updates highscore and performs segue to win screen.
    func endGame (winningPlayer: UILabel, sender: AnyObject) {
        if let winnerExists = highscores[winningPlayer.text!] {
            highscores[winningPlayer.text!]! += 1
            defaults.setObject(self.highscores, forKey: "highscores")
        }
        winner = winningPlayer.text!
        if dict.count() == 0 {
            winReason = "No word starts with:"
        } else {
            winReason = "Word formed:"
        }
        performSegueWithIdentifier("winSegue", sender: sender)
    }
    
    // Selects dictionary based on settings in settings screen.
    func selectedDictionary(defaults: NSUserDefaults) -> String? {
        var dutch = NSBundle.mainBundle().pathForResource("dutch", ofType:"txt")
        var english = NSBundle.mainBundle().pathForResource("english", ofType:
            "txt")
        switch defaults.integerForKey("language") {
        case 0:
            return dutch
        case 1:
            return english
        default:
            return dutch
        }
    }
    
    // Segues winner name, remaining word and win reason to win screen.
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "winSegue" {
            let vc = segue.destinationViewController as! WinViewController
            vc.winner = winner
            vc.word = wordDisplayLabel.text!
            vc.winReason = winReason
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
