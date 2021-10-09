//
//  InstallmentsPlanVC.swift
//  SeenaTask
//
//  Created by Ahmed Abuelmagd on 09/10/2021.
//

import UIKit

// MARK: - Protocol
protocol InstallmentsPlanDeleget: NSObjectProtocol {
    func installmentsPlanClicked(plan: [Plans])
}

class InstallmentsPlanVC: UIViewController {
    
    // MARK: - Variables & Constants
    weak var installmentsPlanDeleget: InstallmentsPlanDeleget?
    var installmentsPlanData = [Plans]()
    var cellHeight = 40.xFactor()
    
    // MARK: - Outlets
    @IBOutlet weak var installmentsPlanTV: UITableView!
    @IBOutlet weak var installmentsPlanTVHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var mainView: UIView!
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        
    }
    
    // MARK: - Actions
    @IBAction func dismissBtnClicked(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension InstallmentsPlanVC{
    func initUI(){
        mainView.addShadow()
        initTV(installmentsPlanTV)
        installmentsPlanTVHeightConstraint.constant = cellHeight * CGFloat(installmentsPlanData.count)
    }
    
    // MARK: - init TableView
    func initTV(_ tv:UITableView){
        tv.dataSource = self
        tv.delegate = self
        tv.registerNib(cell: InstallmentsPlanTVCell.self)
    }
}

extension InstallmentsPlanVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return installmentsPlanData.count
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue() as InstallmentsPlanTVCell
        cell.initCell(data: installmentsPlanData[indexPath.row], index: indexPath.row)
        return cell    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dismiss(animated: true) {
            
            for index in 0..<self.installmentsPlanData.count {
                self.installmentsPlanData[index].isSelected = false
            }
            self.installmentsPlanData[indexPath.row].isSelected = true
            self.installmentsPlanDeleget?.installmentsPlanClicked(plan: self.installmentsPlanData)
        }
        
    }
}
