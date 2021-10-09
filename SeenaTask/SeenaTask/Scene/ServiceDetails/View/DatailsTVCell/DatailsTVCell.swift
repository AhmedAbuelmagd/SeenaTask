//
//  DatailsTVCell.swift
//  SeenaTask
//
//  Created by Ahmed Abuelmagd on 09/10/2021.
//

import UIKit

class DatailsTVCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var branchesLbl: UILabel!
    @IBOutlet weak var planView: UIView!
    @IBOutlet weak var serviceImageView: UIImageView!
    @IBOutlet weak var serviceNameLbl: UILabel!
    @IBOutlet weak var brandNameLbl: UILabel!
    @IBOutlet weak var servicePriceLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var planPeriodLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.planView.circleCornerRadius()
        self.planView.customBorder(width: 1, color: #colorLiteral(red: 0.8588235294, green: 0.07843137255, blue: 0.07843137255, alpha: 1))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    // MARK: - Init Cell
    func initCell(data: ServiceDetails){
        descriptionLbl.text?.removeAll()
        descriptionLbl.text = data.description ?? ""
        brandNameLbl.text = data.brandName ?? ""
        serviceNameLbl.text = data.name ?? ""
        
        var isSelected = false
        for index in 0..<(data.plans?.count ?? 0){
            if (data.plans?[index].isSelected == true){
                isSelected = true
                servicePriceLbl.text = "EGP \(data.plans?[index].price ?? 0)"
                planPeriodLbl.text = data.plans?[index].name ?? ""
            }
        }
        if isSelected == false{
            servicePriceLbl.text = "EGP \(data.plans?[0].price ?? 0)"
            planPeriodLbl.text = data.plans?[0].name ?? ""
        }
        
        if let url = URL(string: (data.brandLogo?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")) {
            serviceImageView.kf.indicatorType = .activity
            serviceImageView.kf.setImage(with: url, placeholder: UIImage(named: "placeholder.png"), options: [.transition(.fade(1))])
        }
        
    }
    
}
