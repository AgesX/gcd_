//
//  main.swift
//  interview
//
//  Created by Jz D on 2021/10/11.
//

import Foundation



func reverseWords(in line: String) -> String{
    struct Position{
        let start: Int
        let end: Int
    }
    let cnt = line.count
    guard cnt > 0 else{
        return line
    }
    var str = line
    var i = 0
    let start = str.startIndex
    var wordBegin: Int? = nil
    while i < cnt{
        let index = str.index(start, offsetBy: i)
        var wordPosition: Position? = nil
        if str[index] == " "{
            if let wordStart = wordBegin, i - 1 - wordStart > 0{
                wordPosition = Position(start: wordStart, end: i - 1)
            }
            wordBegin = nil
        }
        else if i == cnt - 1{
            if let wordStart = wordBegin, i - wordStart > 0{
                wordPosition = Position(start: wordStart, end: i)
            }
            wordBegin = nil
        }
        else if wordBegin == nil{
            wordBegin = i
        }
        if let pos = wordPosition{
            var beginning = pos.start
            var over = pos.end
            while beginning < over{
                let lhs = str.index(start, offsetBy: beginning)
                let rhs = str.index(start, offsetBy: over)
                let lhsVal = String(str[lhs])
                str.replaceSubrange(lhs...lhs, with: String(str[rhs]))
                str.replaceSubrange(rhs...rhs, with: lhsVal)
                beginning += 1
                over -= 1
            }
            wordPosition = nil
        }
        i += 1
    }
    return str
}




var test = "ab g edf hik"

test = "    abefg"


test = "    hello   world"


let result = reverseWords(in: test)

print(result)


