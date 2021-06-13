//
//  Sign.swift
//  RPS
//
//  Created by Timothy Kao on 8/1/20.
//  Copyright © 2020 Timothy Kao. All rights reserved.
//
import GameplayKit
import Foundation
let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)
enum Sign {
    case rock, paper, scissors
}
func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    }
    return .scissors
}
func getEmoji(x: Sign) -> String {
    switch x {
        case .rock:
            return "👊"
        case .paper:
            return "🖐"
        case .scissors:
            return "✌️"
    }
}
func fight(self: Sign, opp: Sign) -> GameState {
    switch opp {
    case .rock:
        switch self {
        case .rock:
            return .draw
        case .paper:
            return .win
        case .scissors:
            return .lose
        }
    case .paper:
        switch self {
        case .rock:
            return .lose
        case .paper:
            return .draw
        case .scissors:
            return .win
        }
    case .scissors:
        switch self {
        case .rock:
            return .win
        case .paper:
            return .lose
        case .scissors:
            return .draw
        }
    }
}
