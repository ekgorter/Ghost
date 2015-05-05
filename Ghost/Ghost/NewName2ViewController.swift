//
//  NewName2ViewController.swift
//  Ghost
//
//  Created by Elias Gorter on 05-05-15.
//  Copyright (c) 2015 EliasGorter6052274. All rights reserved.
//

import UIKit

// Protocol for transferring player 2 name between screens.
protocol NewName2ViewControllerDelegate {
    func saveName2(controller: NewName2ViewController, name: String)
}

class NewName2ViewController: UIViewController {
    
    var delegate: NewName2ViewControllerDelegate? = nil
    var namePlayer2 = ""

    @IBOutlet weak var nameEntryTextField: UITextField!
 
    // Saves entered name for player 2.
    @IBAction func saveNameButton(sender: AnyObject) {
        delegate?.saveName2(self, name: nameEntryTextField!.text!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
