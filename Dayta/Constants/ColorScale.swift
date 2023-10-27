//
//  ColorScale.swift
//  Dayta
//
//  Created by Liam van Leynseele on 5/15/23.
//

import Foundation
import UIKit


let fiveScale: [Int: UIColor] = [
    1: UIColor.red,
    2: UIColor.systemOrange,
    3: UIColor.systemYellow,
    4: UIColor.systemGreen,
    5: UIColor.green
]

let sevenScale: [Int: UIColor] = [
    1: UIColor.red,
    2: UIColor.orange,
    3: UIColor.systemOrange,
    4: UIColor.systemYellow,
    5: UIColor.systemYellow,
    6: UIColor.systemGreen,
    7: UIColor.green
]

func getSliderColor (value: Int, maxInput: Int) -> UIColor {
    if(maxInput == 7){
        return sevenScale[value] ?? UIColor.yellow
    }
    if (maxInput == 5){
        return fiveScale[value] ?? UIColor.yellow
    }
    
    return UIColor.yellow
}
