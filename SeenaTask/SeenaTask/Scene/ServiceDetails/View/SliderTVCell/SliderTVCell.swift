//
//  SliderTVCell.swift
//  SeenaTask
//
//  Created by Ahmed Abuelmagd on 09/10/2021.
//

import UIKit
import ImageSlideshow

class SliderTVCell: UITableViewCell {

    var sliderKFArray: [KingfisherSource] = []
    var vc: UIViewController?
    
    // MARK: - Outlets
    @IBOutlet weak var sliderView: ImageSlideshow!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    // MARK: - Init Cell
    func initCell(cellData: [SliderImages], vc: UIViewController){
        self.vc = vc
        self.sliderKFArray.removeAll()
        for item in cellData {
            if let imageURL =  KingfisherSource(urlString: item.image ?? "" , placeholder: #imageLiteral(resourceName: "placeholder.png"), options: nil) {
                self.sliderKFArray.append(imageURL)
            }
        }
        initSlider(sliderKFArray: sliderKFArray)
    }
    
    // MARK: - Init Slider
    func initSlider(sliderKFArray: [KingfisherSource]) {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        pageControl.pageIndicatorTintColor = UIColor.black
        pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0.8588235294, green: 0.07843137255, blue: 0.07843137255, alpha: 1)
        pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.9647058824, green: 0.9647058824, blue: 0.9647058824, alpha: 1)
        pageControl.frame = CGRect(x: 0, y: 0, width:  10, height:  10)
        sliderView.pageIndicator = pageControl
        sliderView.slideshowInterval = 5.0
        sliderView.pageIndicatorPosition = .init(horizontal: .center, vertical: .customUnder(padding: 10))
        sliderView.contentScaleMode = UIViewContentMode.scaleAspectFill
        sliderView.slideshowInterval = 3.0
        sliderView.activityIndicator = DefaultActivityIndicator()
        sliderView.contentScaleMode = .scaleAspectFill
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.didTap))
        sliderView.addGestureRecognizer(gestureRecognizer)
        sliderView.setImageInputs(sliderKFArray)
    }
    @objc func didTap() {
        sliderView.presentFullScreenController(from: vc!)
    }
    
}
