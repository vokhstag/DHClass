import UIKit

//MARK: - Паттерн Фасад
/* Допустим нам нужно выгрузить изображение в интернет и при этом до выгрузки его нужно маштабировать и сделать квадратным */

class Network {
    func uploadImage(image: UIImage) {
        //Uploading
    }
}

class ImageEditingClass {
    func scaleImage(image: UIImage, compressionQuality: Double) -> UIImage {
        //scaling
        return image
    }
    
    func crop(image: UIImage, size: CGSize) {
        //cropping
    }
}

class FacadeClass {
    let network = Network()
    let editImage = ImageEditingClass()
    
    func editAndUpload(image: UIImage) {
        let squareSide = min(image.size.width, image.size.height)
        let size = CGSize(width: squareSide, height: squareSide)
        editImage.crop(image: image, size: size)
        editImage.scaleImage(image: image, compressionQuality: 0.3)
        network.uploadImage(image: image)
    }
}

//MARK: - Декоратор

//Пример с автомобилем и его комплектациями

protocol Сomplectation {
    func option() -> String
}

final class JustCar: Сomplectation {
    func option() -> String {
        return ""
    }
}

class carDecorator: Сomplectation {
    private var complectation: Сomplectation
    
    init(complectation: Сomplectation) {
        self.complectation = complectation
    }
    
    func option() -> String {
        return complectation.option()
    }
}

class CarWithABS: carDecorator {
    override func option() -> String {
        super.option() + "ABS "
    }
}

class CarWithСonditioner: carDecorator {
    override func option() -> String {
        super.option() + "Сonditioner "
    }
}

let justCar = JustCar()
let carWithABS = CarWithABS(complectation: justCar)
let carWithABSAndСonditioner = CarWithСonditioner(complectation: carWithABS)

print(carWithABSAndСonditioner.option())

