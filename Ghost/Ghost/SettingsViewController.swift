//
//  SettingsViewController.swift
//  Ghost
//
//  Created by Elias Gorter on 11-05-15.
//  Copyright (c) 2015 EliasGorter6052274. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    // For storing current language selected.
    var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()

    // For selecting dictionary language.
    @IBOutlet weak var languageSegmentedControl: UISegmentedControl!
    
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
        defaults.synchronize()
    }
    
    // Clears all player names and highscores from NSUserDefaults.
    @IBAction func clearButton(sender: AnyObject) {
        NSUserDefaults.standardUserDefaults().removeObjectForKey("playerNames")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("highscores")
    }
    
    // Loads view with last language selected from NSUserDefaults.
    override func viewDidLoad() {
        super.viewDidLoad()
        switch defaults.integerForKey("language") {
        case 0:
            languageSegmentedControl.selectedSegmentIndex = 0
        case 1:
            languageSegmentedControl.selectedSegmentIndex = 1
        default:
            break
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
