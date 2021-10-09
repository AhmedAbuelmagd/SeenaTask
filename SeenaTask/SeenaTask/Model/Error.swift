//
//  Error.swift
//  SeenaTask
//
//  Created by Ahmed Abuelmagd on 09/10/2021.
//

import Foundation

struct ResponseError : Codable {
    
    var status: Bool?
    var code: Int?
    var validation: String?
    var desc: String?
    var token: String?

}

