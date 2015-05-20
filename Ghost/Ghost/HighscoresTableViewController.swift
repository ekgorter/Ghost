//
//  HighscoresTableViewController.swift
//  Ghost
//
//  Created by Elias Gorter on 14-05-15.
//  Copyright (c) 2015 EliasGorter6052274. All rights reserved.
//
// Controls the highscore table view. All player names are shown in a table with
// their position and score, sorted from highest score to lowest.

import UIKit

class HighscoresTableViewController: UITableViewController {

    // Contains the stored dictionary of player names with scores.
    var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    var highscores: [String: Int]!
    // Contains the player names sorted by score from highest to lowest.
    var sortedPlayerNames: [String]!
        
    // Show navigation bar in screen.
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Retrieves highscore dictionary if existing.
        if let scores = defaults.objectForKey("highscores") as? [String: Int] {
            highscores = scores
        } else {
            highscores = [:]
        }
        // Sorts player names in highscore dictionary by score, high to low.
        let sortedByHighscores =
            (highscores as NSDictionary).keysSortedByValueUsingComparator
            { ($1 as! NSNumber).compare($0 as! NSNumber) }
        sortedPlayerNames = sortedByHighscores as! [NSString] as! [String]
    }

    // Table is one section.
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    // Returns the amount of rows needed to show all names.
    override func tableView(tableView: UITableView, numberOfRowsInSection
        section: Int) -> Int
    {
        return self.highscores.count
    }

    // Creates table cells with rank, name and score, sorted by rank.
    override func tableView(tableView: UITableView, cellForRowAtIndexPath
        indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("playerNameCell",
            forIndexPath: indexPath) as! UITableViewCell
        let row = indexPath.row
        cell.textLabel?.text = "\(row + 1). " + sortedPlayerNames[row] + " " +
            String(stringInterpolationSegment:
            highscores[sortedPlayerNames[row]]!) as String
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
