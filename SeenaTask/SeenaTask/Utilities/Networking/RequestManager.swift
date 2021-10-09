//
//  RequestManager.swift
//  SeenaTask
//
//  Created by Ahmed Abuelmagd on 09/10/2021.
//

import Foundation
import Moya

// MARK: - Error
enum TKError: Int, Error {
    case unAuthorized = 401
    case badRequest = 400
    case notFound = 404
    case apiError = 500
    case notHandleStatusCode = 0
}

extension TKError {
    func getErrorMessage() -> String? {
        switch self {
        case .unAuthorized: return ERRORS.UNAUTHORIZED.rawValue
        case .notFound: return ERRORS.UNKNOWN.rawValue
        case .badRequest: return ERRORS.BAD_REQUEST.rawValue
        case .apiError: return ERRORS.UNKNOWN.rawValue
        case .notHandleStatusCode: return ERRORS.UNKNOWN.rawValue
        }
    }
}

class RequestManager {
    class func beginRequest<T: Codable, ProvidertType: TargetType>(withTarget target: ProvidertType, responseModel model: T.Type, andHandler handler: @escaping (Result<T, Error>)->()) {
        let loggerConfig = NetworkLoggerPlugin.Configuration(logOptions: .verbose)
        let networkLogger = NetworkLoggerPlugin(configuration: loggerConfig)
        let provider = MoyaProvider<ProvidertType>(plugins: [networkLogger])
        provider.request(target) { (result) in
            switch result {
            case let .success(response):
                if response.statusCode == 200 {
                    do {
                        let model = try JSONDecoder().decode(T.self, from: response.data)
                        handler(.success(model))
                    }catch let error{
                        handler(.failure(error))
                    }
                }else {
                    if let reason = TKError(rawValue: response.statusCode) {
                        handler(.failure(reason))
                    }else {
                        handler(.failure(TKError.notHandleStatusCode))
                    }
                }
            case let .failure(error):
                handler(.failure(error))
            }
        }
    }
}

