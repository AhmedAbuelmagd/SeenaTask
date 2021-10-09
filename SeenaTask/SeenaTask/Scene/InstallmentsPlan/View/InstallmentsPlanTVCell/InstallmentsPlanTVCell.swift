//
//  InstallmentsPlanTVCell.swift
//  SeenaPay Task
//
//  Created by Ahmed Abuelmagd on 09/10/2021.
//

import UIKit

class InstallmentsPlanTVCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var installmentsPlanLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - initCell
    func initCell(data: Plans, index: Int){
        lineView.isHidden = (index == 0) ? true : false
        installmentsPlanLbl.text = "\(data.name ?? "") - EGP \(data.price ?? 0)"
    }
}
