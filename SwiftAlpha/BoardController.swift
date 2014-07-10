//
//  BoardController.swift
//  SwiftAlpha
//
//  Created by natalie on 6/12/14.
//  Copyright (c) 2014 Natalie Podrazik. All rights reserved.
//

import UIKit



class BoardController: UIViewController  {

    var cellArray = Array<UIButton>()
    
    var cellData = BoardMatrix(newEdgeSize: Int(constants.BOARD_EDGE * constants.BOARD_EDGE))
    
    struct constants {
        static let NEIGHBORHOOD_SIZE = Float(3.0)
        static let BOARD_EDGE = Float(3.0 * 3.0)
        static let MAX_CELLS = pow(3.0, 4.0)
        static let EDGE_SIZE_W = Float(35.0)
        static let EDGE_SIZE_H = Float(38.0)
    }
    

    
    func buttonTapped(button_tapped: UIButton) {
        println("you tapped a button, tag = \(button_tapped.tag)")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.initializeBoard()

        self.setUpCellGrid()
    }
    
    func setUpCellGrid() {
        let buffer = 2.0
        
        for i in 0..(constants.BOARD_EDGE) {
            for j in 0..(constants.BOARD_EDGE) {
                
                var x_buffer = 0, y_buffer = 0
                
                var frame = CGRect(x:(Float(j) * constants.EDGE_SIZE_W) + Float(x_buffer),
                    y:(Float(i) * constants.EDGE_SIZE_H) + Float(buffer),
                    width:constants.EDGE_SIZE_W,
                    height:constants.EDGE_SIZE_H);
                
                var index = (i * (constants.BOARD_EDGE)) + j
                
                let button = UIButton()
                if ((j % 2) == (i % 2)) {
                    button.backgroundColor = UIColor.clearColor()
                }
                else {
                    button.backgroundColor = UIColor.whiteColor()
                }
                
                button.addTarget(self,
                                 action:Selector("buttonTapped:"),
                    forControlEvents: UIControlEvents.TouchUpInside)

                
                button.frame = frame
                button.tag = ((Int(i + 1) * 10) + Int(j + 1))
                
                
                cellArray.insert(button, atIndex:Int(index))
                
                self.view.addSubview(button)
            }
        }
        
        var width = constants.EDGE_SIZE_W * constants.BOARD_EDGE
        var height = constants.EDGE_SIZE_H * constants.BOARD_EDGE
        
        // finally, resize self view to be exactly as big as the board.
        self.view.frame.size = CGSizeMake(width, height)
    }
    
    
    
    func initializeBoard() {
        
        // open the file name
        
        /*
        NSString *path = [[NSBundle mainBundle] pathForResource:@"NewsStory1" ofType:@"txt"];
        NSString *content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        */
        
        var path = NSBundle.mainBundle().pathForResource("solved_compressed", ofType:"dat")
        
        // parse its contents
        var content = NSString.stringWithContentsOfFile(path) as NSString
        
        // split on the squares
        
        
        
        println("content string: \(content)")
        
        
        let num_boxes = Int(constants.BOARD_EDGE * constants.BOARD_EDGE)
        
        // fill the board grid by splitting the string every BOARD_SIZE chars.
        assert (((content as String).utf16count >= num_boxes), "Input file is too short.")
        
        
        // split the string into BOARD_EDGE parts.
        for i in (0..constants.BOARD_EDGE) {
        
            var range = NSMakeRange((Int(i) * Int(constants.BOARD_EDGE)),
                                    Int(constants.BOARD_EDGE))
            
            var row = content.substringWithRange(range)
            for j in (0..constants.BOARD_EDGE) {

                // var cell = content.characterAtIndex(Int(i * j))
                var row = String(content.substringWithRange(NSMakeRange(Int(j), 1)))
                
                cellData[Int(i), Int(j)] = row.toInt()!
            }
            println ("row: \(row)")
        }
        
    }
    
    

}