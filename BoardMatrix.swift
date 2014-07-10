//
//  BoardMatrix.swift
//  SudokuSwift
//
//  Created by natalie on 7/10/14.
//  Copyright (c) 2014 Natalie Podrazik. All rights reserved.
//

import Foundation

// Excerpt From: Apple Inc. 
// “The Swift Programming Language.” iBooks. 
// https://itun.es/us/jEUH0.l
class BoardMatrix: NSObject  {

    var edgeSize = Int(3.0 * 3.0)
    
    let rows: Int, cols: Int
    var grid: Int[]
    
    init(newEdgeSize: Int?) {
        
        // optional value
        if let eS = newEdgeSize {
            edgeSize = eS
        }
        
        rows = edgeSize
        cols = edgeSize
        grid = Array(count: rows * cols,
                     repeatedValue: 0)
        
        super.init()
        
        // initialize the array to zeros
        initializeGridWithZeros()
    }

    func initializeGridWithZeros() {

        
        for i in (0..edgeSize) {
            for j in (0..edgeSize) {
                self[i, j] = 0
            }
        }
    }
    
    func indexIsValidForRow(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < cols
    }
    
    subscript(row: Int, column: Int) -> Int {
        get {
            assert(indexIsValidForRow(row, column: column), "Index out of range")
            return grid[(row * cols) + column]
        }
        set {
            assert(indexIsValidForRow(row, column: column), "Index out of range")
            grid[(row * cols) + column] = newValue
        }
    }
}

