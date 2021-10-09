//
//  BaseVMProtocol.swift
//  SeenaTask
//
//  Created by Ahmed Abuelmagd on 09/10/2021.
//

import Foundation

protocol BaseVMProtocol {
    var showLoading: Bindable<Bool> { get set }
    var onShowError: ((_ alert: String) -> Void)?  { get set }
}

