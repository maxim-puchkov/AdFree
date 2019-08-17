//
//  FilterParser.swift
//  AdFree: Blocker
//  com.maximpuchkov.AdFree.AdFree.FilterParser
//
//  Created by mpuchkov on 2019-08-03. macOS 10.14, Xcode 10.1.
//  Copyright © 2019 Maxim Puchkov. All rights reserved.
//

import Foundation







class FilterParser: NSObject {
    
    func getContentsOfFile() {
        if let path = Bundle.main.path(forResource: "EasyList", ofType: "txt") {
            do {
                let contents = try String(contentsOfFile: path, encoding: .utf8)
                let rules = contents.components(separatedBy: .newlines)
                print(rules)
                
                for rule in rules {
                    parse(rule: rule)
                }
            } catch {
                print(error)
            }
        }
        
    }
    
//    // Parse complete list of rules
//    func parse(list: String) -> [Rule] {
//
//        do {
//
//        } catch {
//            print(error)
//        }
//
//    }
    
    func parse(rule: String) -> Rule {
        return Rule(text: "1")
    }
    
    
    
}
