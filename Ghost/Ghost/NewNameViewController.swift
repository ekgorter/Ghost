//
//  NewNameViewController.swift
//  Ghost
//
//  Created by Elias Gorter on 18-05-15.
//  Copyright (c) 2015 EliasGorter6052274. All rights reserved.
//
// Controls view where players can enter a new name.

import UIKit

// Protocol for saving entered player name.
protocol NewNameViewControllerDelegate {
    func saveName(controller: NewNameViewController, name: String, isPlayer1:
        Bool)
}

class NewNameViewController: UIViewController {

    var delegate: NewNameViewControllerDelegate? = nil
    var playerIsPlayer1: Bool = true
    
    // Text field for entering new player name
    @IBOutlet weak var nameEntryTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Saves entered player name.
    @IBAction func saveNameButton(sender: AnyObject) {
        delegate?.saveName(self, name: nameEntryTextField!.text!, isPlayer1:
            playerIsPlayer1)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
