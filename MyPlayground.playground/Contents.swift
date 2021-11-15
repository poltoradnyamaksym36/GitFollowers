import UIKit
import Darwin


protocol Person {
    var age: Int {get set}
}

struct PersonStruct: Person {
    var age: Int
}

class PersonClass: Person {
    var age: Int
    init(age: Int) {
        self.age = age
    }
}

let carl = PersonClass(age: 14)
var john = PersonStruct(age: carl.age)

carl.age = 15
print(carl.age)
print(john.age)
