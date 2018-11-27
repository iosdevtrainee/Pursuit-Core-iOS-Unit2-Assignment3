//
//  ViewController.swift
//  Hangman
//
//  Created by Alex Paul on 11/19/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class HomeController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    guard let button = sender as? UIButton else { return }
//    No need to do this because segues have identifiers
//    guard let gameMode = GameModel.getGameMode(mode: button.tag) else  { return }
//    let isMultiPlayer = isMultiPlayerMode(mode: gameMode)
//    if isMultiPlayer {
//      guard let gameVC = segue.destination as? GameViewController else { return }
//      gameVC.isMultiPlayer = isMultiPlayer
//    } else {
//
//    }
//    segue.identifier
  }
  private func isMultiPlayerMode(mode:GameMode) -> Bool{
    switch mode {
    case .singlePlayer: return false
    case .multiPlayer: return true
    }
  }
}

