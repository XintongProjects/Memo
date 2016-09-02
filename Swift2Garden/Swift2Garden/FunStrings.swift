//
//  FunStrings.swift
//  Swift2Garden
//
//  Created by Cindy on 9/1/16.
//  Copyright © 2016 XintongBi. All rights reserved.
//

import Foundation

func stringExperiments() {
    let s = "[1,2,[15, [3, 4]]"
    let separators = NSCharacterSet(charactersInString: "[], ")
    var components = s.componentsSeparatedByCharactersInSet(separators)
    var result = [String]()
    for i in 0 ..< components.count {
        if components[i] != "" {
            result.append(components[i])
        }
    }
    print("new string is \(result)");
}