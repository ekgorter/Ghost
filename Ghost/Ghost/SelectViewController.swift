//
//  SelectViewController.swift
//  Ghost
//
//  Created by Elias Gorter on 03-05-15.
//  Copyright (c) 2015 EliasGorter6052274. All rights reserved.
//

import UIKit

class SelectViewController: UIViewController, NewName1ViewControllerDelegate, NewName2ViewControllerDelegate {
    
    @IBOutlet weak var player1Label: UILabel!
    
    @IBOutlet weak var player2Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // Saves player 1 name.
    func saveName1(controller: NewName1ViewController, name: String) {
        player1Label.text = name
        controller.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    // Saves player 2 name.
    func saveName2(controller: NewName2ViewController, name: String) {
        player2Label.text = name
        controller.navigationController?.popToRootViewControllerAnimated(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Segues for transferring player names.
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "newName1Segue" {
            let vc = segue.destinationViewController as! NewName1ViewController
            vc.namePlayer1 = player1Label.text!
            vc.delegate = self
        }
        if segue.identifier == "newName2Segue" {
            let vc = segue.destinationViewController as! NewName2ViewController
            vc.namePlayer2 = player2Label.text!
            vc.delegate = self
        }
        if segue.identifier == "gameSegue" {
            
            let vc = segue.destinationViewController as! GameViewController
            vc.player1Name = player1Label.text!
            vc.player2Name = player2Label.text!
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
