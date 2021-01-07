//
//  ViewController.swift
//  Prework
//
//  Created by Andres Noy on 12/30/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var totalPerPersonLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var personCount: UILabel!
    @IBOutlet weak var personCounter: UIStepper!
    
    
    override func viewDidLoad() {
      super.viewDidLoad()
      
      personCounter.wraps = true
      personCounter.autorepeat = true
      personCounter.maximumValue = 10
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        personCount.text = Int(sender.value).description
    }
    
    @IBAction func onTap(_ sender: Any) {
        
        view.endEditing(true)
    }
    @IBAction func calculateTip(_ sender: Any) {
        
        // get the bill amount
        let bill = Double(billField.text!) ?? 0
        
        
        // calculate the tip & total
        
        let tipPercentages = [0.15, 0.18, 0.2]
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        let totalPP = total / personCounter.value
        
        
        
        // update the tip & total labels
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        totalPerPersonLabel.text = String(format: "$%.2f", totalPP)
        
    }
    
}


