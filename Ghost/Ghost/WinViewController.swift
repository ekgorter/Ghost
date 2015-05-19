//
//  WinViewController.swift
//  Ghost
//
//  Created by Elias Gorter on 19-05-15.
//  Copyright (c) 2015 EliasGorter6052274. All rights reserved.
//

import UIKit

class WinViewController: UIViewController {
    
    var winner: String!
    
    var word: String!

    @IBOutlet weak var winnerLabel: UILabel!
    
    @IBOutlet weak var wordLabel: UILabel!
    
    // Hides navigation bar in screen.
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        winnerLabel.text = winner + " Wins!!"
        wordLabel.text = word
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
