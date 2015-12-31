//
//  ViewController.swift
//  Pidge
//
//  Created by Brendon Duan Ho on 12/27/15.
//  Copyright © 2015 Pidge. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollview: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //View 1
        let vc1 = ViewController1(nibName: "ViewController1", bundle: nil)
        self.didMoveToParentViewController(vc1)
        self.scrollview.addSubview(vc1.view)
        vc1.didMoveToParentViewController(self)
        
        //View 2
        let vc2 = ViewController2(nibName: "ViewController2", bundle: nil)
        var frame1 : CGRect = vc2.view.frame
        frame1.origin.x = self.view.frame.size.width
        vc2.view.frame = frame1
        
        self.addChildViewController(vc2)
        self.scrollview.addSubview(vc2.view)
        vc2.didMoveToParentViewController(self)
        
        //View 3
        let vc3 = ViewController3(nibName: "ViewController3", bundle: nil)
        var frame2 : CGRect = vc3.view.frame
        frame2.origin.x = self.view.frame.size.width * 2
        vc3.view.frame = frame2
        
        //Extra!
        
        self.addChildViewController(vc3)
        self.scrollview.addSubview(vc3.view)
        vc3.didMoveToParentViewController(self)
        
        self.scrollview.contentSize = CGSizeMake(self.view.frame.size.width * 3, self.view.frame.size.height)
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

