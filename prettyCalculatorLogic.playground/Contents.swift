5+5
5*(-1)

import UIKit

pow(5.0, 3.0)

infix operator ** { associativity left precedence 200 }

func ** (num: Double, power: Double) -> Double {
    return pow(num, power)
}

5**2
2 ** 3

func percentage(num: Double) -> Double{
    return (num * 0.01)
}

postfix operator %% {}


postfix func %% (num: Double) -> Double {
    return percentage(num)
}

50%% * 5

30%400

50%%

prefix operator %% {}
prefix func %% (num: Double) -> Double {
    return percentage(num)
}


%%40