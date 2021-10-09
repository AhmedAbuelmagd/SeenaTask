//
//  ServiceDetails.swift
//  SeenaTask
//
//  Created by Ahmed Abuelmagd on 09/10/2021.
//

import Foundation

struct ServiceDetails: Codable {
    
    var image: String?
    var name: String?
    var description: String?
    var price: Int?
    var offerPrice: Int?
    var brandLogo: String?
    var brandName: String?
    var sliderImages: [SliderImages]?
    var plans: [Plans]?
    
}
