import UIKit

let name = "Taylor"

for letter in name{
    print("Give me a \(letter)")
    
}

print(name[3])


let password = "123456"
password.hasPrefix("123")
password.hasSuffix("456")


let weather = "it's going to rain"
print(weather.capitalized)

let input = "Swift is like Objective-C without the C"

input.contains("Swift")

let languages = ["Python","Ruby","Swift"]
languages.contains("Swift")

input.containsAny(of: languages)

languages.contains(where: input.contains)


let string = "This is a test string"
let attributes: [NSAttributedString.Key: Any] = [
    .foregroundColor: UIColor.white,
    .backgroundColor: UIColor.red,
    .font: UIFont.boldSystemFont(ofSize: 36)
]

let attributedString = NSAttributedString(string:string,attributes: attributes)




extension String {
    subscript (i:Int) -> String{
        return String(self[self.index(self.startIndex, offsetBy: i)])
    }
    func deletingPrefix(_ prefix: String) -> String{
        guard self.hasPrefix(prefix) else{return self}
        return String(self.dropFirst(prefix.count))
    }
    func deletingSuffix(_ suffix: String) -> String{
        guard self.hasSuffix(suffix) else{return self}
        return String(self.dropLast(suffix.count))
    }
    
    var capitalizedFirst : String{
        guard let firstLetter = self.first else {return ""}
        return firstLetter.uppercased() + self.dropFirst()
    }
    
    func containsAny(of array: [String]) -> Bool{
        for item in array{
            if self.contains(item){
                return true
            }
        }
        
        return false
    }
    
}




