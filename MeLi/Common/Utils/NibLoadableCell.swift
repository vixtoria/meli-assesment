//
//  NibLoadableCell.swift
//  MeLi
//
//  Created by Victoria Rodriguez on 20/2/23.
//

import UIKit

protocol UITableViewNibCell: NibLoadableCell, ReusableView where Self: UITableViewCell { }
protocol UICollectionViewNibCell: NibLoadableCell, ReusableView where Self: UICollectionViewCell { }

protocol NibLoadableCell {
    static var nib: UINib { get }
}

extension NibLoadableCell where Self: UIView {
    static var nib: UINib {
        let nibName = String(describing: self)
        return UINib(nibName: nibName, bundle: nil)
    }
}
