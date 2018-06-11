//: Playground - noun: a place where people can play

import UIKit

var cookies = [[Int]] ()
for _ in 1...9 {
    var row = [Int]()
    for _ in 1...7 {
        row.append(0)
    }
    cookies.append(row)
}

let myCookie = cookies[3][6]

var moreCookies = [[Int]](repeating: [Int](repeating: 0, count:7), count: 9)

let myOtherCookie = moreCookies[3][6]
