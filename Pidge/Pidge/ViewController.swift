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
    }
    
    var V1 : View1 = View1(nibName: "View1", bundle: nil)
    var V2 : View2 = View2(nibName: "view2", bundle: nil)
    
    self.addChildViewController(V1)
    self.scrollView.addSubView(V1.view)
    
    V1.didMoveToParentController(self)
    
    self.addChildViewController(V2)
    self.scrollView.addSubView(V2.view)
    V2.didMoveToParentViewController(self)
    
    var V2Frame : CGRect = V2.view.frame
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

