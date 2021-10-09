//
//  UICollectionViewFlowLayout+Extension.swift
//  SeenaTask
//
//  Created by Ahmed Abuelmagd on 09/10/2021.
//

import UIKit

extension UICollectionViewFlowLayout{
    
    open override var flipsHorizontallyInOppositeLayoutDirection: Bool {
        return isEnglish() ? false : true
    }
}
