//
//  Brain.swift
//  FizzBuzz
//
//  Created by ebdesk-066 on 15/06/19.
//  Copyright © 2019 irig.com. All rights reserved.
//

import Foundation

class Brain {
    
    func isDivisibleByThree(number: Int) -> Bool {
        return isDivisibleBy(divisor: 3, number: number)
    }
    
    func isDivisibleByFive(number: Int) -> Bool {
        return isDivisibleBy(divisor: 5, number: number)
    }
    
    func isDivisibleByFifteen(number: Int) -> Bool {
        return isDivisibleBy(divisor: 15, number: number)
    }
    
    func isDivisibleBy(divisor: Int, number: Int) -> Bool {
        return number % divisor == 0
    }
    
    func check(number: Int) -> Move {
        if isDivisibleByFifteen(number: number){
            return .fizzBuzz
        }else if isDivisibleByThree(number: number) {
            return .fizz
        } else if isDivisibleByFive(number: number) {
            return .buzz
        } else {
            return .number
        }
    }
}
