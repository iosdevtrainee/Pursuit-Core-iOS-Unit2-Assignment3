//
//  CategoriesViewController.swift
//  Hangman
//
//  Created by J on 11/20/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {
  private var categories = ["random","christmas","thanksgiving","valentine's day","independence day","5.3 fellows names"].map{ $0.capitalized }
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
    guard let button = sender as? UIButton,
    let gameViewController = segue.destination as? GameViewController else { return }
    let categoryRow = categoriesPicker.selectedRow(inComponent: 0)
    gameViewController.category = categories[categoryRow]
    // zero corresponds to the only component
    
    
    
  }

}

extension CategoriesViewController : UIPickerViewDataSource {
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return categories.count
  }
  
}

extension CategoriesViewController : UIPickerViewDelegate {
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return categories[row]
  }
}
