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
    enteredWordLabel.text = ""
    guard let text = enterWordTextField.text else { return }
    let transformedText = String(repeating: "_ ", count: text.count)
    enteredWordLabel.text = transformedText
  }
}

extension GameViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    return true
  }
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    print(textField.text ?? "")
    return true
    // shut down the textfield
//    return false
  }
  
}

