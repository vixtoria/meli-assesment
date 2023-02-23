//
//  BaseCell.swift
//  MeLi
//
//  Created by Victoria Rodriguez on 20/2/23.
//

import Foundation
import UIKit

class BaseCell: UITableViewCell, UITableViewNibCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        setupView()
    }
    
    private func setupView() {
        selectionStyle = .none
        backgroundColor = .white
    }
    
}

