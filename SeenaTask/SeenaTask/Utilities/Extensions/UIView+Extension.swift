//
//  UIView+Extension.swift
//  SeenaTask
//
//  Created by Ahmed Abuelmagd on 09/10/2021.
//

import UIKit

extension UIView {
   
    func addShadow(scale: Bool = true) {
        //shadow
        layer.shadowRadius = 6
        layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6)
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 6, height: -5)
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
        self.layer.cornerRadius = 25
        self.clipsToBounds = true
        layer.masksToBounds = false
    }
    func circleCornerRadius(){
        mainQueue {
            self.layer.cornerRadius = self.bounds.height / 2
        }
    }
    func customBorder(width: Int, color: UIColor){
        self.layer.borderWidth = CGFloat(width)
        self.layer.borderColor = color.cgColor
    }
    func addCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    func dropShadow(color: UIColor, opacity: Float, offSet: CGSize, radius: CGFloat, scale: Bool) {
        
        self.backgroundColor = UIColor.white
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offSet
        self.layer.shadowRadius = radius
    }
    func setShadow(scale: Bool = true) {
        //shadow
        layer.shadowRadius = 5
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
        self.layer.cornerRadius = 12
        self.clipsToBounds = true
        layer.masksToBounds = false
    }
}
