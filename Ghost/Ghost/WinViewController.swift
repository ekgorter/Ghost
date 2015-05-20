//
//  WinViewController.swift
//  Ghost
//
//  Created by Elias Gorter on 19-05-15.
//  Copyright (c) 2015 EliasGorter6052274. All rights reserved.
//
// Controls the win screen, displaying the winner and the remaining word.

import UIKit

class WinViewController: UIViewController {
    
    // Variables containing winner name and remaining word.
    var winner: String!
    var word: String!
    var winReason: String!

    // Labels showing winner name and remaining word.
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var winReasonLabel: UILabel!
    @IBOutlet weak var wordLabel: UILabel!
    
    // Hides navigation bar in screen.
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Displays winner name and remaining word in labels.
        winnerLabel.text = winner + " Wins!!"
        wordLabel.text = word
        winReasonLabel.text = winReason
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
