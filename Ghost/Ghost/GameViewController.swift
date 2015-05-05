//
//  GameViewController.swift
//  Ghost
//
//  Created by Elias Gorter on 20-04-15.
//  Copyright (c) 2015 EliasGorter6052274. All rights reserved.
//

import UIKit

// Loads dictionary and game session.
let path = NSBundle.mainBundle().pathForResource("dutch", ofType:"txt")
let dictionary = String(contentsOfFile: path!, encoding: NSUTF8StringEncoding, error: nil)!
let dict = Dictionary(words: dictionary)
let game = Game(dictionary: dict)

class GameViewController: UIViewController {
    
    var player1Name = ""
    var player2Name = ""
    
    @IBOutlet weak var playerOneLabel: UILabel!
    
    @IBOutlet weak var playerTwoLabel: UILabel!
    
    @IBOutlet weak var wordDisplayLabel: UILabel!

    @IBOutlet weak var letterInputTextField: UITextField!
    
    // When "add" button is pressed:
    @IBAction func addLetterButton(sender: AnyObject) {
        
        // Input in textfield is sent to game class.
        game.guess(letterInputTextField.text)
        
        // Label displaying typed letters is updated.
        wordDisplayLabel.text! = game.currentWordTyped
        
        // Clear text field input.
        letterInputTextField.text = ""
        
        // If the game ends the winner is shown.
        if game.ended() == true {
            
            if game.winner() == true {
                playerOneLabel.text = playerOneLabel.text! + " Wins!!"
            } else {
                playerTwoLabel.text = playerTwoLabel.text! + " Wins!!"
            }
            println("Player one wins: \(game.winner())")
            println("Remaining word: \(game.currentWordTyped)")
        }
        
        // The turn passes to the next player.
        game.turn()
        
        // The label with the player name whose turn is over changes to the background color (white) to make it invisible. 
        switch_player_label(playerOneLabel, player2: playerTwoLabel)
    }
    
    // Swaps the text color of the player labels.
    func switch_player_label(player1: UILabel, player2: UILabel) {
        let temp = player1.textColor
        player1.textColor = player2.textColor
        player2.textColor = temp
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerOneLabel.text = player1Name
        playerTwoLabel.text = player2Name
        // Do any additional setup after loading the view.
    }
    
    // Hides navigation bar in game screen.
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
