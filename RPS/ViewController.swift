//
//  ViewController.swift
//  RPS
//
//  Created by Timothy Kao on 8/1/20.
//  Copyright © 2020 Timothy Kao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var oppSign: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var rockSign: UIButton!
    @IBOutlet weak var paperSign: UIButton!
    @IBOutlet weak var scissorsSign: UIButton!
    @IBOutlet weak var playAgainSign: UIButton!
    
    func updateState(state: GameState) {
        switch state {
        case .start:
            status.text = "Rock, Paper, or Scissors?"
            view.backgroundColor = UIColor.white
            oppSign.text = "🤖"
            playAgainSign.isHidden = true
            rockSign.isHidden = false
            paperSign.isHidden = false
            scissorsSign.isHidden = false
            rockSign.isEnabled = true
            paperSign.isEnabled = true
            scissorsSign.isEnabled = true
        case .draw:
            status.text = "Draw..."
            view.backgroundColor = UIColor.gray
            playAgainSign.isHidden = false
            playAgainSign.isEnabled = true
        case .win:
            status.text = "You Win!!!"
            view.backgroundColor = UIColor.green
            playAgainSign.isHidden = false
            playAgainSign.isEnabled = true
        case .lose:
            status.text = "You Lose 😞"
            view.backgroundColor = UIColor.red
            playAgainSign.isHidden = false
            playAgainSign.isEnabled = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateState(state: .start)
        // Do any additional setup after loading the view.
    }

    @IBAction func rockChosen(_ sender: UIButton) {
        paperSign.isHidden = true
        scissorsSign.isHidden = true
        rockSign.isEnabled = false
        paperSign.isEnabled = false
        scissorsSign.isEnabled = false
        let opp = randomSign()
        oppSign.text = getEmoji(x: opp)
        let result = fight(self: .rock, opp: opp)
        updateState(state: result)
    }
    
    @IBAction func paperChosen(_ sender: AnyObject) {
        rockSign.isHidden = true
        scissorsSign.isHidden = true
        let opp = randomSign()
        oppSign.text = getEmoji(x: opp)
        let result = fight(self: .paper, opp: opp)
        updateState(state: result)
    }
    @IBAction func scissorsChosen(_ sender: AnyObject) {
        paperSign.isHidden = true
        rockSign.isHidden = true
        let opp = randomSign()
        oppSign.text = getEmoji(x: opp)
        let result = fight(self: .scissors, opp: opp)
        updateState(state: result)
    }
    @IBAction func playAgainChosen(_ sender: AnyObject) {
        updateState(state: .start)
    }
}

