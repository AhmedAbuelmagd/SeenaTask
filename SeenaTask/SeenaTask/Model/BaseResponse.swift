//
//  BaseResponse.swift
//  SeenaTask
//
//  Created by Ahmed Abuelmagd on 09/10/2021.
//

import Foundation

class BaseResponse<T: Codable>: Codable {
    
    var Error : ResponseError?
    var Response: T?
    
}
