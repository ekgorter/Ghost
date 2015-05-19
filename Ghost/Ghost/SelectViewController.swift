//
//  SelectViewController.swift
//  Ghost
//
//  Created by Elias Gorter on 03-05-15.
//  Copyright (c) 2015 EliasGorter6052274. All rights reserved.
//

import UIKit

// Controls the player selection screen.
class SelectViewController: UIViewController, NewNameViewControllerDelegate, ExistingPlayersTableViewControllerDelegate {
    
    var gameInProgress: Bool = false
    
    var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    var playerNames: [String]!
    var highscores: [String: Int]!
    var playerIsPlayer1: Bool = true
    
    // Displays currently selected players.
    @IBOutlet weak var player1Label: UILabel!
    @IBOutlet weak var player2Label: UILabel!
    
    // Show new name entry screen, for player 1 or player 2.
    @IBAction func newPlayer1Button(sender: AnyObject) {
        playerIsPlayer1 = true
    }
    @IBAction func newPlayer2Button(sender: AnyObject) {
        playerIsPlayer1 = false
        performSegueWithIdentifier("newNameSegue", sender: sender)
    }
    
    // Show table with existing players to select, for player 1 or player 2.
    @IBAction func existingPlayer1Button(sender: AnyObject) {
        playerIsPlayer1 = true
    }
    @IBAction func existingPlayer2Button(sender: AnyObject) {
        playerIsPlayer1 = false
        performSegueWithIdentifier("existingPlayerSegue", sender: sender)
    }
    @IBAction func startGameButton(sender: AnyObject) {
        gameInProgress = false
        defaults.setBool(gameInProgress, forKey: "gameInProgress")
    }

    // Load view with data from NSUserDefaults, if existing.
    override func viewDidLoad() {
        super.viewDidLoad()
        if let playersIsNotNill = defaults.objectForKey("playerNames") as? [String] {
            playerNames = playersIsNotNill
        } else {
            playerNames = []
        }
        if let scores = defaults.objectForKey("highscores") as? [String: Int] {
            highscores = scores
        } else {
            highscores = [:]
        }
    }
    
    // Saves player name.
    func saveName(controller: NewNameViewController, name: String, isPlayer1: Bool) {
        if isPlayer1 {
            player1Label.text = name
        } else {
           player2Label.text = name
        }
        self.playerNames.append(name)
        defaults.setObject(self.playerNames, forKey: "playerNames")
        self.highscores[name] = 0
        defaults.setObject(self.highscores, forKey: "highscores")
    }
    
    // Shows selected player name in label.
    func setName(controller: ExistingPlayersTableViewController, name: String, isPlayer1: Bool) {
        if isPlayer1 {
            player1Label.text = name
        } else {
            player2Label.text = name
        }
    }
    
    // Returns user to player select screen when new name is entered or existing name is chosen.
    @IBAction func unwindToSelect(segue: UIStoryboardSegue) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Segues for transferring player names between screens.
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "newNameSegue" {
            let vc = segue.destinationViewController as! NewNameViewController
            vc.playerIsPlayer1 = playerIsPlayer1
            vc.delegate = self
        }
        if segue.identifier == "existingPlayerSegue" {
            let vc = segue.destinationViewController as! ExistingPlayersTableViewController
            vc.playerIsPlayer1 = playerIsPlayer1
            vc.delegate = self
        }
        if segue.identifier == "gameSegue" {
            let vc = segue.destinationViewController as! GameViewController
            vc.player1Name = player1Label.text!
            vc.player2Name = player2Label.text!
        }
    }
}
