//
//  CommonHelper.swift
//  SeenaTask
//
//  Created by Ahmed Abuelmagd on 09/10/2021.
//

import UIKit
import MOLH

public var screenWidth: CGFloat { get { return UIScreen.main.bounds.size.width } }
public var screenHeight:CGFloat { get { return UIScreen.main.bounds.size.height } }
public var iPhoneXFactor: CGFloat { get {return ((screenWidth * 1.00) / 375.0)} }

public func mainQueue(_ closure: @escaping ()->()) {
    DispatchQueue.main.async(execute: closure)
}

public func delay(_ delay: Double, closure: @escaping ()->()) {
    DispatchQueue.main.asyncAfter(
        deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
}

func isEnglish() -> Bool{
    if MOLHLanguage.isRTLLanguage() { return false } else{ return true }
    
}

// MARK: - loader
public func showLoaderForController(_ controller:UIViewController){
    DispatchQueue.main.async(execute: {
        let loader = Bundle.main.loadNibNamed("LoaderView", owner: controller, options: nil)?.last as! LoaderView
        loader.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        loader.tag = 4000
        controller.view.addSubview(loader)
        loader.showLoader()
        //loader.initLoader()
    })
}



public func hideLoaderForController(_ controller:UIViewController){
    DispatchQueue.main.async(execute: {
        if let view = controller.view.viewWithTag(4000) {
            view.removeFromSuperview()
        }
    })
}
//MARK: - Colors
public func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }
    
    if ((cString.count) != 6) {
        return UIColor.gray
    }
    
    var rgbValue:UInt32 = 0
    Scanner(string: cString).scanHexInt32(&rgbValue)
    
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}
public func getCurrentVC() -> UIViewController? {
    // we must get the root UIViewController and iterate through presented views
    if let rootController = UIApplication.shared.windows.first?.rootViewController {
        var currentController: UIViewController! = rootController
        // Each ViewController keeps track of the view it has presented, so we
        // can move from the head to the tail, which will always be the current view
        while( currentController.presentedViewController != nil ) {
            currentController = currentController.presentedViewController
        }
        return currentController
    }
    return nil
}
@IBDesignable
public class GradientButton: UIButton {
    
    let gradientLayer = CAGradientLayer()
    
    @IBInspectable
    var topGradientColor: UIColor? {
        didSet {
            setGradient(topGradientColor: topGradientColor, bottomGradientColor: bottomGradientColor)
        }
    }
    
    @IBInspectable
    var bottomGradientColor: UIColor? {
        didSet {
            setGradient(topGradientColor: topGradientColor, bottomGradientColor: bottomGradientColor)
        }
    }
    
    private func setGradient(topGradientColor: UIColor?, bottomGradientColor: UIColor?) {
        if let topGradientColor = topGradientColor, let bottomGradientColor = bottomGradientColor {
            gradientLayer.frame = bounds
            gradientLayer.colors = [topGradientColor.cgColor, bottomGradientColor.cgColor]
            gradientLayer.borderColor = layer.borderColor
            gradientLayer.borderWidth = layer.borderWidth
            gradientLayer.cornerRadius = layer.cornerRadius
            layer.insertSublayer(gradientLayer, at: 0)
        } else {
            gradientLayer.removeFromSuperlayer()
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
            self.clipsToBounds = true
        }
    }
    
    override public func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        gradientLayer.frame = bounds
    }
}
