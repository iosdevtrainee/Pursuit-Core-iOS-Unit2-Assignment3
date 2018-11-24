//
//  GameViewController.swift
//  Hangman
//
//  Created by J on 11/20/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
  @IBOutlet weak var guessWordTextField: UITextField!
  @IBOutlet weak var enteredWordLabel: UILabel!
  @IBOutlet weak var enterWordTextField: UITextField!
  
  
  
  public var category: String?
    override func viewDidLoad() {
        super.viewDidLoad()
      guessWordTextField.delegate = self
      enterWordTextField.delegate = self
      if let category = category {
        
      } else {
        enterWordTextField.isHidden = false
      }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

  @IBAction func startNewGame(_ sender: UIButton) {
    if let category = category {
      enterWordTextField.isHidden = true
      guessWordTextField.isHidden = false
      let word = GameModel.getRandomWord(category: category)
      let transformedText = String(repeating: "_ ", count: word.count)
      enteredWordLabel.text = String(Array(transformedText)[...(transformedText.count - 2)])
      
    } else {
      enteredWordLabel.text = ""
      guard let text = enterWordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        else { return }
      let transformedText = String(repeating: "_ ", count: text.count)
      enteredWordLabel.text = String(Array(transformedText)[...(transformedText.count - 2)])
      enterWordTextField.isHidden = true
      guessWordTextField.isHidden = false
    }
    
  }
}

extension GameViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    let text = textField.text
    if textField == guessWordTextField {
      guard text?.count == 1 else { return false }
      
      }
    textField.resignFirstResponder()
    return true
  }
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    if string.count > 1 {
      textField.text = ""
      return false
    }
//    print(textField.text ?? "")
    return true
    // shut down the textfield
//    return false
  }
  
}

