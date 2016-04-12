//
//  ViewController.swift
//  NSDate_Extensions
//
//  Created by Chris Amanse on 5/12/15.
//  Copyright (c) 2015 Joe Christopher Paul Amanse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NSDate().roundDownFrom(.Second)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

