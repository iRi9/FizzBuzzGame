//
//  ViewController.swift
//  FizzBuzz
//
//  Created by ebdesk-066 on 15/06/19.
//  Copyright © 2019 irig.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var numberButton: UIButton!
    @IBOutlet var fizzButton: UIButton!
    @IBOutlet var buzzButton: UIButton!
    @IBOutlet var fizzBuzzButton: UIButton!
    

    var gameScore: Int? {
        didSet {
            guard let newScore = gameScore else { return }
            numberButton.setTitle("\(newScore)", for: .normal)
        }
    }
    var game: Game?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game = Game()
        guard let checkedGame = game else { return }
        gameScore = checkedGame.score
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func play(move: Move) {
        guard let unwrappedGame = game else { return }
        
        let response = unwrappedGame.play(move: move)
        gameScore = response.score
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        switch sender {
        case numberButton:
            play(move: .number)
        case fizzButton:
            play(move: .fizz)
        case buzzButton:
            play(move: .buzz)
        case fizzBuzzButton:
            play(move: .fizzBuzz)
        default:
            print("Invalid selection")
        }
    }
}

