//
//  ServiceDetailsVC.swift
//  SeenaTask
//
//  Created by Ahmed Abuelmagd on 09/10/2021.
//

import UIKit

class ServiceDetailsVC: UIViewController {

    // MARK: - Outlets
    let viewModel = HomeVM()
    
    // MARK: - Outlets
    @IBOutlet weak var detailsTV: UITableView!
    @IBOutlet weak var bookBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()

    }
    
    // MARK: - Actions
    @IBAction func bookBtnClicked(_ sender: UIButton) {
        let vc = InstallmentsPlanVC()
        vc.modalPresentationStyle = .overFullScreen
        vc.installmentsPlanData = viewModel.photosData.value?.Response?.serviceDetails?.plans ?? []
        vc.installmentsPlanDeleget = self
        present(vc, animated: true, completion: nil)
    }

}

extension ServiceDetailsVC{
    
    func initUI(){
        bindViewModel()
        viewModel.getServiceData()
        initTV(detailsTV)
    }
    
    // MARK: - init TableView
    func initTV(_ tv:UITableView){
        tv.dataSource = self
        tv.delegate = self
        tv.registerNib(cell: SliderTVCell.self)
        tv.registerNib(cell: DatailsTVCell.self)
        tv.registerNib(cell: SimilarServicesTVCell.self)
        tv.estimatedRowHeight = 1000
        tv.rowHeight = UITableView.automaticDimension
        
    }
    func bindViewModel() {
        // bind loading
        viewModel.showLoading.bind { [weak self] visible in
            if self != nil {
                visible ? showLoaderForController(getCurrentVC() ?? UIViewController()) : hideLoaderForController(getCurrentVC() ?? UIViewController())
            }
        }
        
        // bind error message
        viewModel.onShowError = { message in
            print(message)
        }
        // bind photosData model
        viewModel.photosData.bind {[weak self] result in
            self?.detailsTV.reloadData()
        }
    }
}
extension ServiceDetailsVC: UITableViewDelegate{}
extension ServiceDetailsVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0: return 310.xFactor()
        case 2: return 240.xFactor()
        default: return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0: let cell = tableView.dequeue() as SliderTVCell
            cell.initCell(cellData: viewModel.photosData.value?.Response?.serviceDetails?.sliderImages ?? [], vc: self)
            return cell
        case 1: let cell = tableView.dequeue() as DatailsTVCell
            if let data = viewModel.photosData.value?.Response?.serviceDetails{
                cell.initCell(data: data)
            }
            
            return cell
        default: let cell = tableView.dequeue() as SimilarServicesTVCell
            if let data = viewModel.photosData.value?.Response?.similarServices{
                cell.initCell(data: data)
            }
            return cell
        }
    }
    
}
extension ServiceDetailsVC: InstallmentsPlanDeleget{
    func installmentsPlanClicked(plan: [Plans]) {
        viewModel.photosData.value?.Response?.serviceDetails?.plans = plan
        let indexPathRow:Int = 1
        let indexPosition = IndexPath(row: indexPathRow, section: 0)
        detailsTV.reloadRows(at: [indexPosition], with: .none)
        
        
    }
}
