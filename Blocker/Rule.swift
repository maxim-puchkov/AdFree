//
//  Rule.swift
//  AdFree: Blocker
//  com.maximpuchkov.AdFree.AdFree.Rule
//
//  Created by mpuchkov on 2019-08-03. macOS 10.14, Xcode 10.1.
//  Copyright © 2019 Maxim Puchkov. All rights reserved.
//

import Foundation

// A single filter rule
class Rule {
    
    let text: String
    let json: String
    
    init(text: String) {
        self.text = text
        self.json = "ERROR"
        
        print("Rule initialized: \(self.text), \(self.json)")
    }
    
    func convert(_ text: String) -> String {
        return "ERROR 2"
    }
    
}
