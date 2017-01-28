//
//  ViewController.swift
//  DTSLog
//
//  Created by Danny Sung on 01/27/2017.
//  Copyright (c) 2017 Danny Sung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.textView.text = ""
        
        DTSLog.shared.stringAction = { string in
            self.textView.text = self.textView.text + string + "\n"
            print(string)
        }
        
        // Do any additional setup after loading the view, typically from a nib.
        DLog("This is a debug log")
        WLog("This is a warning")
        ELog("This is an error")
    }

}

