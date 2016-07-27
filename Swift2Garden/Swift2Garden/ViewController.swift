//
//  ViewController.swift
//  Swift2Garden
//
//  Created by Cindy Bi on 7/15/16.
//  Copyright © 2016 XintongBi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func isMatch(s: String, _ p: String) -> Bool {
        let charS = Array(arrayLiteral: s)
        let charP = Array(arrayLiteral: p)
        let sLen = charS.count
        let pLen = charP.count
        var dp = Array(count:sLen+1, repeatedValue:
            Array(count:pLen + 1, repeatedValue:false))
        dp[0][0] = true
        // init special case for *, when it can be treated as empty when previous is a match
        for i in 0 ..< pLen {
            if (charP[i] == "*" && dp[0][i-1] == true){
                dp[0][i+1] = true;
            }
        }
        for i in 0 ..< sLen {
            for j in 0 ..< pLen {
                if (charP[j] == "."){
                    dp[i+1][j+1] = dp[i][j];
                }
                if (charP[j] == charS[i]){
                    dp[i+1][j+1] = dp[i][j];
                }
                if(charP[j] == "*"){
                    if (charP[j-1] != charS[i] && charP[j-1] != ".") {
                        dp[i+1][j+1] = dp[i+1][j-1];
                    }
                    else {
                        dp[i+1][j+1] = dp[i][j+1] || //a* represents mutiple aa...a
                            dp[i+1][j] || // a* represents 1a, ie. a
                            dp[i+1][j-1]; // a* represents empty ""
                    }
                }//end if
            }// enf for j
        }//end for i
        return dp[sLen][pLen];
    }
}

