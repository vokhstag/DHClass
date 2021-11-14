//
//  NetworkServiceError.swift
//  URLSessionHW
//
//  Created by Yunus Abubakarov on 13.11.2021.
//

import Foundation

enum NetworkServiceError: Error {
    case nonResponse
    case request(statusCode: Int)
    case network
    case decode
    case unknown

    var message: String {
        switch self {
        case .nonResponse:
            return "HTTPResponce не получен"
        case .request(let statusCode):
            switch statusCode {
            case 400:
                return "Некорректный запрос"
            case 404:
                return "Страница не найдена"
            default:
                return "Ошибка запроса"
            }
        case .network:
            return "Проблема с сервером"
        case .decode:
            return "Не удалось декодировать данные"
        case .unknown:
            return "Не известная ошибка"
        }
    }

}
