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

        // Do any additional setup after loading the view.
        
        // let attachment = NSItemProvider(contentsOf: Bundle.main.url(forResource: "blockerList", withExtension: "json"))!

        if let url = Bundle.main.path(forResource: "blockerList", ofType: "json") {
            do {
                // let result = try String(contentsOf: url)
                let contents = try String(contentsOfFile: url, encoding: .utf8)
                self.textView.text = contents
                print(contents)
            } catch {
                print(error)
            }
        } else {
            print("Path error")
            self.textView.text = "Unable to display contents of blockerList.json"
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

}
