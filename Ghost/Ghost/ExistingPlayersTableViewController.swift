//
//  ExistingPlayersTableViewController.swift
//  Ghost
//
//  Created by Elias Gorter on 18-05-15.
//  Copyright (c) 2015 EliasGorter6052274. All rights reserved.
//
// Controls table view where an existing player name can be picked.

import UIKit

// Protocol for setting player name to selected name.
protocol ExistingPlayersTableViewControllerDelegate {
    func setName(controller: ExistingPlayersTableViewController, name: String,
        isPlayer1: Bool)
}

class ExistingPlayersTableViewController: UITableViewController {
    
    var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    var playerNames: [String]!
    var delegate: ExistingPlayersTableViewControllerDelegate? = nil
    var playerIsPlayer1: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Loads saved player names in table if existing.
        if let names = defaults.objectForKey("playerNames") as? [String] {
            playerNames = names
        } else {
            playerNames = []
        }
    }
    
    // Table is one section.
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    // Returns the amount of rows needed to show all names.
    override func tableView(tableView: UITableView, numberOfRowsInSection
        section: Int) -> Int
    {
        return self.playerNames.count
    }
    
    // Creates table cells with player names.
    override func tableView(tableView: UITableView, cellForRowAtIndexPath
        indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("playerNameCell",
            forIndexPath: indexPath) as! UITableViewCell
        let row = indexPath.row
        cell.textLabel?.text = playerNames[row] as String
        return cell
    }
    
    // Registers if user selected specific cell in table view.
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath
        indexPath: NSIndexPath)
    {
        // The selected row is highlighted only briefly.
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let cell = self.tableView.cellForRowAtIndexPath(indexPath)
        let text = cell?.textLabel?.text
        // Set player name to selected name.
        if let text = text {
            delegate?.setName(self, name: text, isPlayer1: playerIsPlayer1)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
