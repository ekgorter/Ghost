//
//  MainMenuViewController.swift
//  Ghost
//
//  Created by Elias Gorter on 18-05-15.
//  Copyright (c) 2015 EliasGorter6052274. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {
    
    var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    var gameInProgress: Bool = false
    
    var player1Name: String!
    var player2Name: String!
    var currentWord: String!
    var currentTurn: Bool!
    
    @IBOutlet weak var resumeButton: UIButton!
    
    // Unwinds navigation to main menu.
    @IBAction func unwindToMenu(segue: UIStoryboardSegue) {
        if let gameStatus = defaults.boolForKey("gameInProgress") as Bool? {
            gameInProgress = gameStatus
        }
        if gameInProgress {
            if let player1 = defaults.objectForKey("player1") as? String {
                player1Name = player1
            }
            if let player2 = defaults.objectForKey("player2") as? String {
                player2Name = player2
            }
            if let word = defaults.objectForKey("currentWord") as? String {
                currentWord = word
            }
            if let turn = defaults.boolForKey("playerTurn") as Bool? {
                currentTurn = turn
            }
            resumeButton.hidden = false
        } else {
            resumeButton.hidden = true
        }
    }
    
    // Show navigation bar in screen.
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if let gameStatus = defaults.boolForKey("gameInProgress") as Bool? {
            gameInProgress = gameStatus
        }
        if gameInProgress {
            if let player1 = defaults.objectForKey("player1") as? String {
                player1Name = player1
            }
            if let player2 = defaults.objectForKey("player2") as? String {
                player2Name = player2
            }
            if let word = defaults.objectForKey("currentWord") as? String {
                currentWord = word
            }
            if let turn = defaults.boolForKey("playerTurn") as Bool? {
                currentTurn = turn
            }
        } else {
            resumeButton.hidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "resumeSegue" {
            let vc = segue.destinationViewController as! GameViewController
            vc.player1Name = player1Name
            vc.player2Name = player2Name
            vc.currentWord = currentWord
            vc.currentTurn = currentTurn
        }
    }
}
