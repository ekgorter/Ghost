//
//  NewName1ViewController.swift
//  Ghost
//
//  Created by Elias Gorter on 03-05-15.
//  Copyright (c) 2015 EliasGorter6052274. All rights reserved.
//

import UIKit

// Protocol for transferring player 1 name between screens.
protocol NewName1ViewControllerDelegate {
    func saveName1(controller: NewName1ViewController, name: String)
}

class NewName1ViewController: UIViewController {
    
    var delegate: NewName1ViewControllerDelegate? = nil
    
    @IBOutlet weak var nameEntryTextField: UITextField!
    
    // Saves entered player name.
    @IBAction func saveNameButton(sender: AnyObject) {
        delegate?.saveName1(self, name: nameEntryTextField!.text!)
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
