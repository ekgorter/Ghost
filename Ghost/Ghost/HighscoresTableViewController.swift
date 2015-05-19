//
//  HighscoresTableViewController.swift
//  Ghost
//
//  Created by Elias Gorter on 14-05-15.
//  Copyright (c) 2015 EliasGorter6052274. All rights reserved.
//

import UIKit

// Controls the highscore table view.
class HighscoresTableViewController: UITableViewController {

    var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    var highscores: [String: Int]!
    var playerNames: [String]!
        
    // Show navigation bar in screen.
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
    }
    
    // Loads player names and scores if existing.
    override func viewDidLoad() {
        super.viewDidLoad()
        if let names = defaults.objectForKey("playerNames") as? [String] {
            playerNames = names
        } else {
            playerNames = []
        }
        if let scores = defaults.objectForKey("highscores") as? [String: Int] {
            highscores = scores
        } else {
            highscores = [:]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // Returns number of sections.
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    // Returns the amount of rows needed to show all names.
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.highscores.count
    }

    // Creates table cells by copying prototype cell and adding names and scores.
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("playerNameCell", forIndexPath: indexPath) as! UITableViewCell
        let row = indexPath.row
        cell.textLabel?.text = playerNames[row] + " " + String(stringInterpolationSegment: highscores[playerNames[row]]!) as String
        return cell
    }
}
