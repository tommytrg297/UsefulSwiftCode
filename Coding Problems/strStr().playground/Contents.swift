import Foundation

var haystack = "hello"
var needle = "ll"


func strStr(_ haystack: String, _ needle: String) -> Int {
    if needle.count == 0 {
        return 0
    }
    var hs = haystack
    var count = 0
    while (hs.count >= needle.count) {
        if hs.hasPrefix(needle){
            return count
        }
        else {
            count += 1
            hs.removeFirst()
        }
    }
    return -1
}


strStr(haystack, needle)

