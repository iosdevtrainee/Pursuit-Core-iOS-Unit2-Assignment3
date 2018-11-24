//
//  CategoriesViewController.swift
//  Hangman
//
//  Created by J on 11/20/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {
  private var categories = GameModel.getCategories()
  @IBOutlet weak var categoriesPicker: UIPickerView!
  override func viewDidLoad() {
        super.viewDidLoad()
        categoriesPicker.dataSource = self
        categoriesPicker.delegate = self
        // Do any additional setup after loading the view.
    }
  /*
   // MARK: - Navigation
   */
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let gameViewController = segue.destination as?
                                          GameViewController else { return }
    // zero corresponds to the only component
    let categoryRow = categoriesPicker.selectedRow(inComponent: 0)
    gameViewController.category = categories[categoryRow]
  }

}

/*
 // MARK: - Picker Data Source Methods
 */
extension CategoriesViewController : UIPickerViewDataSource {
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return categories.count
  }
  
}

/*
 // MARK: - Picker Delegate Methods
 */

extension CategoriesViewController : UIPickerViewDelegate {
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return categories[row]
  }
  
}
