//
//  SimilarServicesTVCell.swift
//  SeenaTask
//
//  Created by Ahmed Abuelmagd on 09/10/2021.
//

import UIKit

class SimilarServicesTVCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var similarServicesCV: UICollectionView!
    
    var cellData = [SimilarServices]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    // MARK: - Init Cell
    func initCell(data: [SimilarServices]){
        self.cellData = data
        initCV(cv: similarServicesCV)
    }
    
    // MARK: - init CollectionView
    func initCV(cv: UICollectionView) {
        cv.dataSource = self
        cv.delegate = self
        cv.registerCVNib(cell: SimilarServicesCVCell.self)
        mainQueue {
            cv.contentOffset.x = 0
        }
    }
    
}
extension SimilarServicesTVCell: UICollectionViewDelegate {
}
extension SimilarServicesTVCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellData.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCV(index: indexPath) as SimilarServicesCVCell
        cell.initCell(data: cellData[indexPath.row])
        return cell
    }
    
}
extension SimilarServicesTVCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let colomnNumber: CGFloat = 2.3
        let cellWidth = collectionView.bounds.width * 0.77
        let collectionViewHeight = (cellWidth * 0.9)
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let spaceBetweenCells = flowLayout.minimumLineSpacing
        let adjustedWidth = collectionView.bounds.width - (spaceBetweenCells*2)
        let width = adjustedWidth / colomnNumber
        return CGSize(width: width, height: collectionViewHeight)
    }
}
