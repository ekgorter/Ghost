//
//  MainMenuViewController.swift
//  Ghost
//
//  Created by Elias Gorter on 18-05-15.
//  Copyright (c) 2015 EliasGorter6052274. All rights reserved.
//
// Controls the root view of the game and it's navigation controller. The resume 
// game button is hidden until there is a game currently in progress.

import UIKit

class MainMenuViewController: UIViewController {
    
    // Variables containing information for a game in progress, if any.
    var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    var gameInProgress: Bool = false
    var player1Name: String!
    var player2Name: String!
    var currentWord: String!
    var currentTurn: Bool!
    
    // The resume button is hidden unless there is a game in progress.
    @IBOutlet weak var resumeButton: UIButton!
    
    // Show navigation bar in view.
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Checks for game in progress, loads game data if true.
        loadGameProgress()
    }
    
    // Unwinds navigation to main menu.
    @IBAction func unwindToMenu(segue: UIStoryboardSegue) {
        loadGameProgress()
    }
    
    // Checks for a game in progress.
    func loadGameProgress() {
        if let gameStatus = defaults.boolForKey("gameInProgress") as Bool? {
            gameInProgress = gameStatus
        }
        // When a game is in progress, all current game info is retrieved.
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
            // The resume game button is made available.
            resumeButton.hidden = false
        // The resume game button is hidden when there is no game in progress.
        } else {
            resumeButton.hidden = true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        // When resume game button is pressed, all stored game info is segued.
        if segue.identifier == "resumeSegue" {
            let vc = segue.destinationViewController as! GameViewController
            vc.player1Name = player1Name
            vc.player2Name = player2Name
            vc.currentWord = currentWord
            vc.currentTurn = currentTurn
        }
    }
}
