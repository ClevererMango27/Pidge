//
//  ViewController.swift
//  Groupsnap
//
//  Created by Brendon Ho on 12/31/15.
//  Copyright © 2015 Pidge. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //View 1
        let view1 : ViewController1 = ViewController1(nibName: "ViewController1", bundle: nil)
        
        self.addChildViewController(view1)
        self.scrollView.addSubview(view1.view)
        view1.didMoveToParentViewController(self)
        
        //View 2
        let view2 : ViewController2 = ViewController2(nibName: "ViewController2", bundle: nil)
        
        self.addChildViewController(view2)
        self.scrollView.addSubview(view2.view)
        view2.didMoveToParentViewController(self)
        //Camera View or View 3
        
        //Additional Code
        var viewTwoFrame : CGRect = view2.view.frame
        viewTwoFrame.origin.x = self.view.frame.width
        view2.view.frame = viewTwoFrame
        
        self.scrollView.contentSize = CGSizeMake(self.view.frame.width * 2, self.view.frame.size.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

