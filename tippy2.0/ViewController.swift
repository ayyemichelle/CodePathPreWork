//
//  ViewController.swift
//  tippy2.0
//
//  Created by Michelle Vasquez-Aleman on 1/6/20.
//  Copyright © 2020 Michelle Vasquez-Aleman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func onTap(_ sender: Any) {
        print("Hello")
        
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        // ** many of the controls are different and the tutorial posted on youtube is now outdated. I wasn't able to figure out how to tie the segment event of the value being changed to this function. Dragging it as described in the tutorial did not work. **
        
        // get the bill
        let bill = Double(billField.text!) ?? 0
        // calculate tip and total
        let tipPercentages = [0.15,0.18, 0.2]
        print(tipControl.selectedSegmentIndex)
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip;
        // update tip and total labels
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    
    
}

