//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Taha Enes Aslantürk on 29.04.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

struct CalculatorBrain {
    var pctOfTip: Float = 0.1
    var nOfPeople: Int = 2
    var splittedValue:Float = 0
    
    mutating func calculateSplittedMoney(billAmount: Float?) {
        if billAmount != nil {
            let total = billAmount! * (1 + pctOfTip)
            splittedValue = total / Float(nOfPeople)
        }
    }
    
    func getSplittedValue() -> String {
        return String(format: "%.2f",splittedValue)
    }
    
    func getDetailsText() -> String {
        return "Split between \(nOfPeople) people, with \(pctOfTip * 100)% tip."
    }
}
