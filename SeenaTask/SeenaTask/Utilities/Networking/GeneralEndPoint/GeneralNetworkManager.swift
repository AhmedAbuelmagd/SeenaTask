//
//  GeneralNetworkManager.swift
//  SeenaTask
//
//  Created by Ahmed Abuelmagd on 09/10/2021.
//

import Foundation

protocol GeneralNetworkProtocol {
    func getServiceData(completionHandler: @escaping (Result<BaseResponse<Service>?, Error>)->())
}

class GeneralNetworkManager: GeneralNetworkProtocol {
    func getServiceData(completionHandler: @escaping (Result<BaseResponse<Service>?, Error>) -> ()) {
        RequestManager.beginRequest(withTarget: GeneralAPIs.getServiceDetails, responseModel: BaseResponse<Service>?.self) { result in
            completionHandler(result)
        }
    }
}
