//
//  GameViewController.swift
//  Hangman
//
//  Created by J on 11/20/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
  @IBOutlet weak var winningMessageLabel: UILabel!
  @IBOutlet weak var guessWordTextField: UITextField!
  @IBOutlet weak var enteredWordLabel: UILabel!
  @IBOutlet weak var enterWordTextField: UITextField!
  @IBOutlet weak var guessRemainingLabel: UILabel!
  @IBOutlet weak var hangmanImage: UIImageView!
  @IBOutlet weak var newGameButton: UIButton!
  
  private var gameModel: GameModel!
  private var word:[String]!
  private var endGameMessage:String = "You "
  private var separator:String = " "
  
  private func displayFeedbackOnGuess(){
    let numGuesses = gameModel.getRemainingGuesses()
    updateImage(guess: numGuesses)
    guessRemainingLabel.text = "\(7 - numGuesses)"
  }
  
  private func updateImage(guess:Int){
    hangmanImage.image = UIImage(named: "hang\(guess)")
  }
  
  public var category: String?
    override func viewDidLoad() {
        super.viewDidLoad()
      guessWordTextField.delegate = self
      enterWordTextField.delegate = self
      if let _ = category {
      } else {
        enterWordTextField.isHidden = false
      }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

  private func prepareGame(_ text: String) {
    let str = String(repeating: "_", count: text.count)
    word = Array(str).map{$0.description}
    enteredWordLabel.text = word.joined(separator: " ")
    gameModel.storeEnteredWord(word: text)
    enterWordTextField.isHidden = true
    guessWordTextField.isHidden = false
    winningMessageLabel.isHidden = true
  }
  
  @IBAction func startNewGame(_ sender: UIButton) {
    gameModel = GameModel()
    displayFeedbackOnGuess()
    if let category = category {
      let text = GameModel.getRandomWord(category: category)
      prepareGame(text)
    } else {
      if !guessWordTextField.isHidden {
        
      } else {
        enteredWordLabel.text = ""
        guard let text = enterWordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
          else { return }
        prepareGame(text)
      }
    }
    
  }
  private func endGame(_ status: (gameOver: Bool, playerStatus: GameStatus?)) {
    endGameMessage += "\(status.playerStatus!)"
    winningMessageLabel.text = endGameMessage
    winningMessageLabel.isHidden = false
    guessWordTextField.isHidden = true
    let hiddenWord = gameModel.getHiddenWord()
    enteredWordLabel.text = word == hiddenWord ? word.joined(separator: separator) : hiddenWord.joined(separator: separator)
  }

}


extension GameViewController: UITextFieldDelegate {
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if textField == guessWordTextField {
      guard let text = textField.text, text.count == 1 else { return false }
      guard gameModel.addChar(char: Character(text)) else { return false }
      let indices = gameModel.getPositionsInWord(char: text)
      word = word.indices.map {indices.contains($0) ? text : word[$0]}
      enteredWordLabel.text = word.joined(separator: " ")
      displayFeedbackOnGuess()
      let status = gameModel.isGameOver()
      if status.gameOver {
        endGame(status)
      }
      textField.text = ""
      if textField == enterWordTextField {
        startNewGame(newGameButton)
        }
      }
    textField.resignFirstResponder()
    return true
  }
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    if textField == guessWordTextField {
      return (textField.text?.count)! <= 0  && !gameModel.hasBeenEntered(char: string)
    }
    return true
  }
  
}

