//
//  APIManager.swift
//  TechnicalTask
//
//  Created by macbook m1 on 29.11.23.
//

import UIKit

class APIManager {
    
    //MARK: - Properties
    private let urlString = "https://dog.ceo/api/breeds/image/random"
    var randomImage: UIImage!
}

//MARK: - Loading methods
extension APIManager {
    func loadImage(completion: @escaping(UIImage?) -> ()) {
        let url = URL(string: urlString)!
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data, let postImage = try? JSONDecoder().decode(ImageData.self, from: data) {
                self.loadImageContent(url: postImage.message, completion: completion)
            }
        }
        task.resume()
    }
    
    func loadImageContent(url: String, completion: @escaping(UIImage?) -> ()) {
        let task = URLSession.shared.dataTask(with: URLRequest(url: URL(string: url)!)) { data, response, error in
            if let data, let image = UIImage(data: data) {
                self.randomImage = image
                completion(self.randomImage)
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
}
