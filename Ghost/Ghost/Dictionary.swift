//
//  Dictionary.swift
//  Ghost
//
//  Created by Elias Gorter on 19-04-15.
//  Copyright (c) 2015 EliasGorter6052274. All rights reserved.
//

import Foundation

class Dictionary {
    
    // Lists containing dictionary and filtered dictionary.
    var words: [String]
    let wordsBackup: [String]
    
    init(words: [String]) {
        
        self.words = words
        self.wordsBackup = words
    }
    
    // Filters dictionary array using given string. 
    // TO DO: Only filter when strings are equal from beginning of string.
    func filter(filterWord: String) {
        
        self.words = words.filter {$0.rangeOfString(filterWord) != nil}
        }

    // Counts amount of words remaining in filtered dictionary.
    func count() -> Int {
        
        return self.words.count
    }

    // Returns single remaining word in dictionary.
    func result() -> String {
            
        return self.words[0]
    }
    
    // Returns dictionary to pre-filtered state.
    func reset() {
        
        self.words = self.wordsBackup
    }
}