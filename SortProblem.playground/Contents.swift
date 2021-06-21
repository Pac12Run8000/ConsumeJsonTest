import UIKit


let inputString = "is2 sentence4 This1 a3"

func sortElementsOfSentence(input:String) -> String {
    
    var dict = [Int:String]()
    let elementArray = input.components(separatedBy: " ")
    for item in elementArray.enumerated() {
        
        if let str = item.element.last, let strNum = String(str) as? String, let intNum = Int(strNum), var word = item.element as? String {
            word.removeLast()
            dict[intNum] = word
        }
    }
    let outputArray = dict.sorted(by: {($0.key < $1.key)}).map({ (key, value) -> String in
        return "\(value)"
    })
    
    return outputArray.joined(separator: " ") + "."
}

sortElementsOfSentence(input: inputString)
