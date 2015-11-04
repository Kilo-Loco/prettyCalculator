//
//  Operator Logic.swift
//  Pretty Calculator
//
//  Created by Kyle Lee on 11/4/15.
//  Copyright © 2015 Kyle Lee. All rights reserved.
//

import Foundation

infix operator ** { associativity left precedence 120 }
func ** (num: Double, power: Double) -> Double {
    return pow(num, power)
}

func percentage(num: Double) -> Double {
    return (num * 0.01)
}
postfix operator %% {}
postfix func %% (num: Double) -> Double {
    return percentage(num)
}
prefix operator %% {}
prefix func %% (num: Double) -> Double {
    return percentage(num)
}

enum Operation: String {
    case Divide = "/"
    case Multiply = "*"
    case Subtract = "-"
    case Add = "+"
    case Equals = "="
    case PosNeg = "*(-1)"
    case Decimal = "."
    case Clear = ""
    case Percentage = "%%"
    case Exponent = "**"
}
