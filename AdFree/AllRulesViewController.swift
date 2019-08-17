//
//  AllRulesViewController.swift
//  AdFree: AdFree
//  com.maximpuchkov.AdFree.AdFree.AllRulesViewController
//
//  Created by mpuchkov on 2019-08-03. macOS 10.14, Xcode 10.1.
//  Copyright © 2019 Maxim Puchkov. All rights reserved.
//

import UIKit

class AllRulesViewController: ViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Disable scrolling until view appears
        self.textView.isScrollEnabled = false
        
        // Name and type of the file to display
        let resourceName = "blockerList"
        let resourceType = "json"
        
        // Find path of the required file; else display an error
        if let url = Bundle.main.path(forResource: resourceName, ofType: resourceType) {
            // Get and Display contents of the file; or display caught error
            do {
                let contents = try String(contentsOfFile: url, encoding: .utf8)
                self.textView.text = contents
            } catch {
                print(error)
                self.textView.text = "Error: \(error)."
            }
        } else {
            let errorText = "Unable to display contents of \(resourceName).\(resourceType)."
            
            print("Error: \(errorText)")
            self.textView.text = "Error: \(errorText)\n\nBundle identifier: \(Bundle.main.bundleIdentifier!)."
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // Enable text view scrolling
        self.textView.isScrollEnabled = true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
