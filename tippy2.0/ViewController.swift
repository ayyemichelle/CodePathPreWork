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
    
    @IBOutlet var mainView: UIView!
    
    @IBOutlet weak var split: UILabel!
    @IBOutlet weak var incrementStepper: UIStepper!
    @IBOutlet weak var totalPerPersonField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        incrementStepper.maximumValue = 5
    }


    @IBAction func onTap(_ sender: Any) {
        print("Hello")
        
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        switch (tipControl.selectedSegmentIndex) {
        case 0:
            mainView.backgroundColor = UIColor.yellow
        case 1:
            mainView.backgroundColor = UIColor.orange
        case 2:
            mainView.backgroundColor = UIColor.green
        default: break
        }
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
    
    @IBAction func splitCount(_ sender: UIStepper) {
        
        split.text = Int(sender.value).description
        let totalText = totalLabel.text!.dropFirst()
        let total = Double(totalText) ?? 0
        print("total: ",total)
        let splitVal = Double(split.text!) ?? 0
        print("split val: ", splitVal)
        let ppp = total/splitVal
        print(ppp)
        totalPerPersonField.text = String(format: "$%.2f", ppp)
        
    }
    
    
}

