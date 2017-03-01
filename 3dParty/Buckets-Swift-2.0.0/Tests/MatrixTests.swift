//
//  MatrixTests.swift
//  Buckets
//
//  Created by Mauricio Santos on 4/12/15.
//  Copyright (c) 2015 Mauricio Santos. All rights reserved.
//

import Foundation
import XCTest
import Buckets

class MatrixTests: XCTestCase {
    
    var matrix: Matrix<Double> = [[1]]
    
    func testInitWithRepeatedValue() {
        matrix = Matrix(rows: 10, columns: 10, repeating: 5)
        XCTAssertEqual(matrix.rows, 10)
        XCTAssertEqual(matrix.columns, 10)
        for i in 0..<matrix.rows {
            for j in 0..<matrix.columns {
                XCTAssertEqual(matrix[i,j], 5)
            }
        }
    }
    
    func testInitWithGrid() {
        matrix = Matrix(rows: 2, columns: 2, grid: [1,2,3,4])
        var counter = 1.0
        for i in 0..<matrix.rows {
            for j in 0..<matrix.columns {
                XCTAssertEqual(matrix[i,j], counter)
                counter += 1
            }
        }
    }
    
    func testInitWithRows() {
        matrix = Matrix([[1,2,3],[4,5,6]])
        var counter = 1.0
        for i in 0..<matrix.rows {
            for j in 0..<matrix.columns {
                XCTAssertEqual(matrix[i,j], counter)
                counter += 1
            }
        }
    }
    
    func testTranspose() {
        var transpose = matrix.transpose
        XCTAssertEqual(transpose[0,0], 1)
        transpose = Matrix([[1,2,3],[4,5,6]]).transpose
        XCTAssertEqual(transpose[0,0], 1)
        XCTAssertEqual(transpose[0,1], 4)
        XCTAssertEqual(transpose[1,0], 2)
        XCTAssertEqual(transpose[1,1], 5)
        XCTAssertEqual(transpose[2,0], 3)
        XCTAssertEqual(transpose[2,1], 6)
    }
    
    // MARK: SequenceType
    
    func testSequenceTypeConformance() {
        matrix = Matrix([[1,2,3],[4,5,6]])
        XCTAssertTrue(matrix.elementsEqual([1,2,3,4,5,6]))
    }
    
    // MARK: ArrayLiteralConvertible
    
    func testArrayLiteralConvertibleConformance() {
        matrix = [[1,2,3], [4,5,6]]
        var counter = 1.0
        for i in 0..<matrix.rows {
            for j in 0..<matrix.columns {
                XCTAssertEqual(matrix[i,j], counter)
                counter += 1
            }
        }
    }
    
    // MARK: Operators
    
    func testEqual() {
        var other: Matrix<Double>  = [[1]]
        XCTAssertTrue(matrix == other)
        matrix = [[3,2]]
        XCTAssertFalse(matrix == other)
        other = [[3,2]]
        XCTAssertTrue(matrix == other)
    }
    
    // MARK: Linear Algebra

    #if os(OSX) || os(iOS)
    
    func testMatrixAddition() {
        matrix = matrix + [[3]]
        XCTAssertEqual(matrix[0,0], 4)
        
        matrix = [[1,2],[3,4]]
        matrix += [[1, 1], [1, 1]]
        XCTAssertEqual(matrix[0,0], 2)
        XCTAssertEqual(matrix[0,1], 3)
        XCTAssertEqual(matrix[1,0], 4)
        XCTAssertEqual(matrix[1,1], 5)
    }
    
    func testScalarAddition() {
        matrix = matrix + 1
        matrix = 2 + matrix
        XCTAssertEqual(matrix[0,0], 4)
        
        matrix = [[1,2],[3,4]]
        matrix += 1
        XCTAssertEqual(matrix[0,0], 2)
        XCTAssertEqual(matrix[0,1], 3)
        XCTAssertEqual(matrix[1,0], 4)
        XCTAssertEqual(matrix[1,1], 5)
    }
    
    func testMatrixSubstraction() {
        matrix = matrix - [[1]]
        XCTAssertEqual(matrix[0,0], 0)
        
        matrix = [[1,2,3],[4,5,6]]
        matrix -= [[1, 1, 1], [1, 1, 1]]
        XCTAssertEqual(matrix[0,0], 0)
        XCTAssertEqual(matrix[0,1], 1)
        XCTAssertEqual(matrix[0,2], 2)
        XCTAssertEqual(matrix[1,0], 3)
        XCTAssertEqual(matrix[1,1], 4)
        XCTAssertEqual(matrix[1,2], 5)
    }
    
    func testScalarSubstraction() {
        matrix = matrix - 1
        XCTAssertEqual(matrix[0,0], 0)
        
        matrix = [[1,2],[3,4]]
        matrix -= 1
        XCTAssertEqual(matrix[0,0], 0)
        XCTAssertEqual(matrix[0,1], 1)
        XCTAssertEqual(matrix[1,0], 2)
        XCTAssertEqual(matrix[1,1], 3)
    }
    
    func testNegation() {
        matrix = [[0,1],[2,3]]
        matrix = -matrix
        XCTAssertEqual(matrix[0,0], 0)
        XCTAssertEqual(matrix[0,1], -1)
        XCTAssertEqual(matrix[1,0], -2)
        XCTAssertEqual(matrix[1,1], -3)
    }
    
    func testMatrixMultiplication() {
        matrix = [[3,2], [4,5], [6,7]]
        matrix = matrix * [[10,20,30], [30,40,50]]
        XCTAssertEqual(matrix.rows, 3)
        XCTAssertEqual(matrix.columns, 3)
        
        XCTAssertEqual(matrix[0,0], 90)
        XCTAssertEqual(matrix[0,1], 140)
        XCTAssertEqual(matrix[0,2], 190)
        XCTAssertEqual(matrix[1,0], 190)
        XCTAssertEqual(matrix[1,1], 280)
        XCTAssertEqual(matrix[1,2], 370)
        XCTAssertEqual(matrix[2,0], 270)
        XCTAssertEqual(matrix[2,1], 400)
        XCTAssertEqual(matrix[2,2], 530)
    }
    
    func testScalarMultiplication() {
        matrix = matrix * 2
        matrix = 2 * matrix
        XCTAssertEqual(matrix[0,0], 4)
        
        matrix = [[1,2],[3,4]]
        matrix *= 2
        XCTAssertEqual(matrix[0,0], 2)
        XCTAssertEqual(matrix[0,1], 4)
        XCTAssertEqual(matrix[1,0], 6)
        XCTAssertEqual(matrix[1,1], 8)
    }
    
    func testScalarDivision() {
        matrix = [[4]]
        matrix = matrix / 2
        XCTAssertEqual(matrix[0,0], 2)
        
        matrix = [[2,4],[6,8]]
        matrix /= 2
        XCTAssertEqual(matrix[0,0], 1)
        XCTAssertEqual(matrix[0,1], 2)
        XCTAssertEqual(matrix[1,0], 3)
        XCTAssertEqual(matrix[1,1], 4)
    }
    
    func testInverse() {
        matrix = [[1,1], [1,2]]
        if let inv = Buckets.inverse(matrix) {
            XCTAssertEqual(inv[0,0], 2)
            XCTAssertEqual(inv[0,1], -1)
            XCTAssertEqual(inv[1,0], -1)
            XCTAssertEqual(inv[1,1], 1)
        } else {
            XCTFail()
        }
    }
    #endif
}
