//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    var calculatorBrain = CalculatorBrain()

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var twentyButton: UIButton!
    @IBOutlet weak var splitLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tipButtonPressed(_ sender: UIButton) {
        zeroButton.isSelected = false
        tenButton.isSelected = false
        twentyButton.isSelected = false
        if(sender.currentTitle == "0%"){
            zeroButton.isSelected = true
            calculatorBrain.pctOfTip = 0
        } else if sender.currentTitle == "10%" {
            tenButton.isSelected = true
            calculatorBrain.pctOfTip = 0.1
        } else {
            twentyButton.isSelected = true
            calculatorBrain.pctOfTip = 0.2
        }
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        splitLabel.text = String(format: "%.0f", sender.value)
        calculatorBrain.nOfPeople = Int(sender.value)
        
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        if billTextField.text != nil {
            calculatorBrain.calculateSplittedMoney(billAmount: Float(billTextField.text ?? "0"))
            performSegue(withIdentifier: "goToResultScreen", sender: self)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResultScreen" {
            let resultsVC = segue.destination as! ResultsViewController
            resultsVC.splitValue = calculatorBrain.getSplittedValue()
            resultsVC.detailsText = calculatorBrain.getDetailsText()
            
        }
    }
    


}

