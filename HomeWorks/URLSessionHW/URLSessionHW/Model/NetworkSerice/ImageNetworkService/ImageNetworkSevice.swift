//
//  ImageNetworkSevice.swift
//  URLSessionHW
//
//  Created by Yunus Abubakarov on 14.11.2021.
//

import Foundation

class ImageNetworkSevice: BaseNetworkService, ImageNetworkSeviceProtocol {
    
    func getImage(url: URL, completion: @escaping (GetImageResponce) -> Void) {
        let handler: Handler = { rawData, response, error in
            do {
                let data = try self.httpResponse(data: rawData, response: response)
                completion(.success(data))
            } catch(let error) {
                completion(.failure((error as? NetworkServiceError) ?? .decode))
            }
        }
        session.dataTask(with: url, completionHandler: handler).resume()
    }
    
}
