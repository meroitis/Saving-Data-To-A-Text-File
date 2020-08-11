//
//  ViewController.swift
//  Storing Data To A Text File
//
//  Created by Cristobal Romero on 8/11/20.
//  Copyright © 2020 Cristobal Romero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func writeMyText(_ sender: Any) {
        let fm = FileManager.default
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urls.last?.appendingPathComponent("file.text")
        do {
            try typetextHere.text.write(to: url!, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            print("Error writing file")
        }
    }
    @IBAction func readMyText(_ sender: Any) {
        let fm = FileManager.default
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urls.last?.appendingPathComponent("file.text")
        do {
            let fileContent = try String(contentsOf: url!, encoding: String.Encoding.utf8)
            displayTextHere.text = fileContent
        } catch {
            print("Error reading file")
        }
    }
    
    
    @IBOutlet var typetextHere: UITextView!
    
    
    @IBOutlet var displayTextHere: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        typetextHere.text = "Type your new text here"
        displayTextHere.text = ""
        
    }
    


}

