//
//  SelectViewController.swift
//  Ghost
//
//  Created by Elias Gorter on 03-05-15.
//  Copyright (c) 2015 EliasGorter6052274. All rights reserved.
//

import UIKit

class SelectViewController: UIViewController, NewName1ViewControllerDelegate, NewName2ViewControllerDelegate, Player1NamesTableViewControllerDelegate, Player2NamesTableViewControllerDelegate {
    
    var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    var playerNames: [String]!
    var highscores: [String: Int]!
    
    @IBOutlet weak var player1Label: UILabel!
    
    @IBOutlet weak var player2Label: UILabel!
    
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
        // Do any additional setup after loading the view.
    }
    
    // Saves player 1 name.
    func saveName1(controller: NewName1ViewController, name: String) {
        player1Label.text = name
        self.playerNames.append(name)
        defaults.setObject(self.playerNames, forKey: "playerNames")
        self.highscores[name] = 0
        defaults.setObject(self.highscores, forKey: "highscores")
    }
    
    // Returns user to player select screen when new name is entered.
    @IBAction func unwindToSelect(segue: UIStoryboardSegue) {
        
    }
    
    // Saves player 2 name.
    func saveName2(controller: NewName2ViewController, name: String) {
        player2Label.text = name
        self.playerNames.append(name)
        defaults.setObject(self.playerNames, forKey: "playerNames")
        self.highscores[name] = 0
        defaults.setObject(self.highscores, forKey: "highscores")
    }

    func setName1(controller: Player1NamesTableViewController, name: String) {
        player1Label.text = name
    }
    
    func setName2(controller: Player2NamesTableViewController, name: String) {
        player2Label.text = name
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Segues for transferring player names.
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "newName1Segue" {
            let vc = segue.destinationViewController as! NewName1ViewController
            vc.delegate = self
        }
        if segue.identifier == "newName2Segue" {
            let vc = segue.destinationViewController as! NewName2ViewController
            vc.delegate = self
        }
        if segue.identifier == "gameSegue" {
            
            let vc = segue.destinationViewController as! GameViewController
            vc.player1Name = player1Label.text!
            vc.player2Name = player2Label.text!
        }
        if segue.identifier == "selectName1Segue" {
            let vc = segue.destinationViewController as! Player1NamesTableViewController
            vc.delegate = self
        }
        if segue.identifier == "selectName2Segue" {
            let vc = segue.destinationViewController as! Player2NamesTableViewController
            vc.delegate = self
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
