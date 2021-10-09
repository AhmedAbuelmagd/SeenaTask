//
//  SimilarServicesCVCell.swift
//  SeenaTask
//
//  Created by Ahmed Abuelmagd on 09/10/2021.
//

import UIKit

class SimilarServicesCVCell: UICollectionViewCell {

    // MARK: - Outlets
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var serviceImageView: UIImageView!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var brandNameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.setShadow()
    }
    
    // MARK: - Init Cell
    func initCell(data: SimilarServices){
        if let url = URL(string: (data.image?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")) {
            serviceImageView.kf.indicatorType = .activity
            serviceImageView.kf.setImage(with: url, placeholder: UIImage(named: "placeholder.png"), options: [.transition(.fade(1))])
        }
        nameLbl.text = data.name ?? ""
        brandNameLbl.text = data.brandName ?? ""
        priceLbl.text = "EGP \(data.price ?? 0)"
    }

}
