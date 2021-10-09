//
//  UITableView+Extension.swift
//  SeenaTask
//
//  Created by Ahmed Abuelmagd on 09/10/2021.
//

import UIKit

extension UITableView {
    /**
     It register table view cell nib file to the table.
     ### For Example ###
     let me suppose that the outlet of table view is TV
     ````
     TV.registerNib(cell: DetailsCell.self)
     ````
     */
    func registerNib<Cell: UITableViewCell>(cell: Cell.Type) {
        let nibName = String(describing: Cell.self)
        self.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: nibName)
    }
    /**
     It dequeue the cell in cellForRowAt.
     ## Important Notes ##
     we call that function in cellForRowAt
     ### For Example ###
     ````
     cell = tableview.dequeue() as DetailsCell
     return cell
     ````
     */
    func dequeue<Cell: UITableViewCell>() -> Cell {
        let identifier = String(describing: Cell.self)
        guard let cell = self.dequeueReusableCell(withIdentifier: identifier) as? Cell else {
            fatalError("Error in cell")
        }
        return cell
    }
}
class ContentSizedTableView: UITableView {
    override var contentSize: CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}
