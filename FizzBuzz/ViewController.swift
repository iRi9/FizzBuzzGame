//
//  ViewController.swift
//  FizzBuzz
//
//  Created by ebdesk-066 on 15/06/19.
//  Copyright © 2019 irig.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var gameScore: Int?
    var game: Game?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game = Game()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func play(move: String) {
        guard let unwrappedGame = game else { return }
        
        let response = unwrappedGame.play(move: move)
        gameScore = response.score
    }

}

