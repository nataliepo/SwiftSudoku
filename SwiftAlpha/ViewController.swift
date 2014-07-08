//
//  ViewController.swift
//  SwiftAlpha
//
//  Created by natalie on 6/11/14.
//  Copyright (c) 2014 Natalie Podrazik. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    // UX elements
    var boardViewController = BoardController()
    
    init(coder aDecoder: NSCoder!)  {
        super.init(coder: aDecoder)
        
        // self.boardView = BoardController()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // center frame.
        var y_offset = (self.view.frame.height - boardViewController.view.frame.height) / 2
        var x_offset = (self.view.frame.width - boardViewController.view.frame.width) / 2
        
        boardViewController.view.frame = CGRectMake(x_offset,
                                                    y_offset,
                                                    boardViewController.view.frame.width,
                                                    boardViewController.view.frame.width)
        
        
        println("frame: \(NSStringFromCGRect(boardViewController.view.frame))")
        
        self.view.addSubview(boardViewController.view)
        
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }




}

