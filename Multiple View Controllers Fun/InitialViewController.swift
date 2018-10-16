//
//  ViewController.swift
//  Multiple View Controllers Fun
//
//  Created by Gina Sprint on 10/11/18.
//  Copyright © 2018 Gina Sprint. All rights reserved.
//

import UIKit

// MARK: - Multiple View Controllers
// so far, all of our apps have had one screen
// recall: 1 scene in IB = 1 screen in the app = managed by 1 view controller

// MARK: - Segue
// a segue is a transition from one view controller to the next
// two ways to trigger a segue
// automatic (let IB handle)
// manual (we'll trigger in the swift code)

class InitialViewController: UIViewController {
    @IBOutlet var username: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // we want to pass the username from the text field to the second view controller
    // the prepare(for segue): callback is executed whenever a segue is about to occur
    // you pass data into the destination view controller here
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // sender is the view that triggered this segue (if there is one)
        // segue has three important properties
        // source: this is the instigating view controller
        // destination: this is the new view controller
        // identifier: this is the string you may have set up in IB (storyboard)
        if let identifier = segue.identifier {
            if identifier == "automaticSegue" || identifier == "manualSegue" {
                // we want to downcast using as? the destination general UIViewController to a specific subclass SecondViewController
                if let secondVC = segue.destination as? SecondViewController {
                    // set a username property in secondVC
                    // task: take it from here
                    if let usernameString = username.text {
                        secondVC.username = usernameString
                    }
                }
            }
        }
    }
    
    // when the user precesses logout, we want to unwind this method to initial view controller
    @IBAction func unwindToInitialVC(segue: UIStoryboardSegue) {
        print("unwinding to initial view controller")
    }
    
    @IBAction func manualSeguePressed(_ sender: UIButton) {
        // trigger a manual segue
        print("triggering a manual segue")
        // call preform segue
        performSegue(withIdentifier: "manualSegue", sender: self)
    }
    
    // one more segue related method to show
    // only called for automatic interface builder segue
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        // we dont want to segue to second view controller if the credentials aren't correct
        // return true  if the user enters a username
        // return false if they dont enter a username
        if username.text == "" || username.text == nil {
            return false
        } else {
            return true
        }
    }
    
}

