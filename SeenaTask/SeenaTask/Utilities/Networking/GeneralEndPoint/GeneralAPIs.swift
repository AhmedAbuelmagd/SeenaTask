//
//  GeneralAPIs.swift
//  SeenaTask
//
//  Created by Ahmed Abuelmagd on 09/10/2021.
//

import Foundation
import Moya

enum GeneralEndPoint: String, CaseIterable {
    case SERVICE_DETAILS = "5QRI"
}

enum GeneralAPIs {
    case getServiceDetails
}

extension GeneralAPIs: TargetType {
    var baseURL: URL {
        guard let url = URL(string: Config.BASE_URL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .getServiceDetails: return GeneralEndPoint.SERVICE_DETAILS.rawValue
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getServiceDetails: return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getServiceDetails: return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
        
    }
}
