//
//  ImageNetworkSeviceProtocol.swift
//  URLSessionHW
//
//  Created by Yunus Abubakarov on 14.11.2021.
//

import Foundation

typealias GetImageResponce = Result<Data, NetworkServiceError>

protocol ImageNetworkSeviceProtocol {
    func getImage(url: URL, completion: @escaping (GetImageResponce)-> Void)
}
