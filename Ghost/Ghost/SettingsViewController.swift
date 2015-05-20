//
//  SettingsViewController.swift
//  Ghost
//
//  Created by Elias Gorter on 11-05-15.
//  Copyright (c) 2015 EliasGorter6052274. All rights reserved.
//
// Controls the settings view, where the game dictionary language can be set and 
// all existing player names and scores can be deleted.

import UIKit

class SettingsViewController: UIViewController {
    
    // Current language selected is stored in NSUserDefaults.
    var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()

    // For selecting dictionary language.
    @IBOutlet weak var languageSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Loads view with last language selected from NSUserDefaults.
        switch defaults.integerForKey("language") {
        case 0:
            languageSegmentedControl.selectedSegmentIndex = 0
        case 1:
            languageSegmentedControl.selectedSegmentIndex = 1
        default:
            break
        }
    }
    
    // Remembers selected language in NSUserDefaults, 0 is dutch, 1 is english.
    @IBAction func saveLanguageSegmentedControl(sender: UISegmentedControl) {
        var index = sender.selectedSegmentIndex
        switch index {
        case 0:
            defaults.setInteger(index, forKey: "language")
        case 1:
            defaults.setInteger(index, forKey: "language")
        default:
            break
        }
    }
    
    // Clears all player names and highscores from NSUserDefaults.
    @IBAction func clearButton(sender: AnyObject) {
        NSUserDefaults.standardUserDefaults().removeObjectForKey("playerNames")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("highscores")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
