//: [Previous](@previous)

import Foundation

//잘못된 비동기 처리 함수
func getImage(with urlString: String) -> UIImage? {
    let url = URL(string: urlString)!
    var photoImage: UIImage? = nil
    URLSession.shared.dataTask(with: url) { (data, res, err) in
        if error != nil { return }
        
        guard let safeData = data else {return}
        photoImage = UIImage(data: safeData)
    }.resume()
    return photoImage
}

func properlyGetImage(with urlString: String, completionHandler: @escaping (UIImage?)->Void ) {
    let url = URL(string: urlString)!
    var photoImage: UIImage? = nil
    URLSession.shared.dataTask(with: url) { (data, res, err) in
        if error != nil { return }
        
        guard let safeData = data else {return}
        photoImage = UIImage(data: safeData)

        completionHandler(photoImage)
    }.resume()
}

properlyGetImage(with: "https://bit.ly/32ps0DI") {(image) in
    //handling image code
}



//: [Next](@next)
