//
//  GameModel.swift
//  Hangman
//
//  Created by J on 11/20/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

class GameModel {
  private var word:String!
  private var wordCharSet:Set<Character>!
  private var guessedCharSet:Set<Character>!
  private var guesses: Int = 7
  
  public static func getGameMode(mode:Int) -> GameMode? {
    return GameMode.init(rawValue: mode)
  }
  
  public func storeEnteredWord(word:String){
    self.word = word
  }
  
  public func checkWin() -> Bool{
    return wordCharSet.intersection(guessedCharSet) == wordCharSet
  }
  public func addChar(char:Character) -> Bool{
    if winningWordContainsChar(char: char){
      
    }
    return true
  }
  
  private func winningWordContainsChar(char:Character) -> Bool{
    return self.wordCharSet.contains(char)
  }
  
  public func getRemainingGuesses() -> Int{
    return self.guesses
  }
  
}

