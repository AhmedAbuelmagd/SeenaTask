//
//  ServiceVM.swift
//  SeenaTask
//
//  Created by Ahmed Abuelmagd on 09/10/2021.
//

import Foundation

protocol ServiceVMProtocol {

    func getServiceData()
}

class HomeVM: BaseVMProtocol, ServiceVMProtocol {
    
    var photosData = Bindable<BaseResponse<Service>?>(nil)
    
    var showLoading: Bindable<Bool> = Bindable(false)
    
    var onShowError: ((String) -> Void)?
    
    let apiClient: GeneralNetworkManager
    init(apiClient: GeneralNetworkManager = GeneralNetworkManager()) {
        self.apiClient = apiClient
    }
    
    func getServiceData() {
        showLoading.value = true
        apiClient.getServiceData { [weak self] result in
            self?.showLoading.value = false
            switch result {
            case .success(let serviceData):
                print("SUCCESS: => \(serviceData) THIS IS SUCCESS FOR getServiceData API")
                self?.photosData.value = serviceData
            case .failure(let errorData):
                print("Error: => \(errorData) THIS IS ERROR FOR getServiceData API")
                if let errors = errorData as? TKError {
                    self?.onShowError?(errors.getErrorMessage() ?? ERRORS.UNKNOWN.rawValue)
                }else {
                    self?.onShowError?(ERRORS.UNKNOWN.rawValue)
                }
            }
        }
    }
    
}

