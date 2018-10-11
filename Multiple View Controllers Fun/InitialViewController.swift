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
            if identifier == "automaticSegue" {
                // we want to downcast using as? the destination general UIViewController to a specific subclass SecondViewController
                if let secondVC = segue.destination as? SecondViewController {
                    // set a username property in secondVS
                    // task: take it from here
                }
            }
        }
    }
    
}

