//ЮНУС АБУБАКАРОВ

import UIKit

/**
 1. Напишите расширение для коллекций целых чисел, которое возвращает,
 сколько раз определенная цифра фигурирует в любом из его номеров.

  Код [5, 15, 55, 515].testFunc(count: "5") должен возвращать 6.
  Код [5, 15, 55, 515].testFunc(count: "1") должен возвращать 2.
  Код [55555].testFunc(count: "5") должен возвращать 5
  Код [55555].testFunc(count: "1") должен возвращать 0.
 */
extension Array where Element == Int {
    func testFunc(count digit: Int) -> Int {
        var numbers = 0
        for value in self {
            var i = value
            while i > 0 {
                if i % 10 == digit {
                    numbers += 1
                }
                i = i/10
            }
        }
        return numbers
    }
}

[5, 15, 55, 515].testFunc(count: 5)
[5, 15, 55, 515].testFunc(count: 1)
[55555].testFunc(count: 5)
[55555].testFunc(count: 1)
/**
 2. Отсортировать массив по длине строк его значений

 ["a", "abc", "ab"].testSorted() должен возвращать ["abc", "ab", "a"].
 */
extension Array where Element == String {
    func testSorted() -> [String] {
        var val = self
        val.sort { (a, b) -> Bool in
            return a.count > b.count
        }
        return val
    }
}

["a", "abc", "ab", "asdff"].testSorted()

/**
 3. Создайте функцию, которая принимает массив несортированных чисел от 1 до 100,
 где ноль или более чисел могут отсутствовать, и возвращает массив отсутствующих чисел например: 

 var testArray = Array(1...100)
 testArray.remove(at: 25)
 testArray.remove(at: 20)
 testArray.remove(at: 6)

 getMissingNumbers(input: testArray) // [7, 21, 26]
 */
func getMissingNumbers(input array: [Int]) -> [Int] {
    var missingValues: [Int] = []
    for i in 1...100 {
        if array.firstIndex(of: i) == nil {
            missingValues.append(i)
        }
    }
    return missingValues
}

var testArray = Array(1...100)
testArray.remove(at: 25)
testArray.remove(at: 20)
testArray.remove(at: 6)

getMissingNumbers(input: testArray) // [7, 21, 26]

/**
 4. Поменять значения массива местами (не использовать reverse)
 Пример:
 var array = [1, 2, 3]
 array.testReverse()

 */
extension Array where Element: Equatable {
    func testReverse() -> [Element] {
        var val = self
        val.sort { (a, b) -> Bool in
            return firstIndex(of: a)! > firstIndex(of: b)!
        }
        return val
    }
}

var array = [1, 2, 3]
var array3 = ["a", "b", "c"]
array.testReverse()
array3.testReverse()
/**
 Решите проблему сильных ссылок
 */

class Person {
  let name: String
  let email: String
  weak var car: Car?

  init(name: String, email: String) {
    self.name = name
    self.email = email
  }

  deinit {
    print("Goodbye \(name)!")
  }
}

class Car {
  let id: Int
  let type: String
  var owner: Person?

 init(id: Int, type: String) {
   self.id = id
   self.type = type
 }

 deinit {
   print("Goodbye \(type)!")
 }
}

var owner: Person? = Person(name: "Cosmin",
                            email: "cosmin@whatever.com")
var car: Car? = Car(id: 10, type: "BMW")

owner?.car = car
car?.owner = owner

owner = nil
car = nil


