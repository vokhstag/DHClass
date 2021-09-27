//Юнус Абубакаров

import UIKit

/**
1. Создать менеджер и протокол для менеджера, которые будут принимать универсальный тип

Ограничить тип протоколом Profile, который будет вызывать метод отображающий в консоль имя и фамилию (реализовать значения через расширения)

Ограничить тип протоколом Adress, который будет отображать в консоль улицу и город

 */
protocol Profile {
    func fullName()
}

extension Profile {
    func fullName() {
        print("Ivan Ivanov")
    }
}

struct someProfile: Profile {
}

protocol Adress {
    func getAdress()
}

extension Adress {
    func getAdress() {
        print("SomeName str. 51")
    }
}

struct someAdress: Adress {
}

protocol ManagerType {
    associatedtype T
    
    func get(data: T)
}



class Manager1: ManagerType {
    typealias T = Profile
    
    func get(data: T) {
        data.fullName()
    }
}

class Manager2: ManagerType {
    typealias T = Adress
    
    func get(data: T) {
        data.getAdress()
    }
}

let manager1 = Manager1()
manager1.get(data: someProfile())

let manager2 = Manager2()
manager2.get(data: someAdress())

/**
 2. Создать класс, который будет иметь опциональное свойство и его тип ввиде протокола.

 Протокол должен иметь ассоциативный тип и метод, вызывающий/принимающий его



 Формат:
 protocol RequestManager {
     associatedtype Result

     func get() -> Result
 }

 class NetworkManager {
     var requestManager: RequestManager?

     func getAllMovies() {
         requestManager.get()
     }
 }
 */
 
 protocol RequestManager {
     associatedtype Result

    func get() -> Result
 }

class NetworkManager<ManagerType> where ManagerType: RequestManager {
    var requestManager: ManagerType?

    func getAllMovies() {
        requestManager?.get()
     }
 }

