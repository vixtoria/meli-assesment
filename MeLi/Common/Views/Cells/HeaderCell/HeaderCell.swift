//
//  HeaderCell.swift
//  MeLi
//
//  Created by Victoria Rodriguez on 23/2/23.
//

import Foundation
import UIKit

class HeaderCell: BaseCell {

    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
//    @IBOutlet weak var priceLabel: UILabel!
//    @IBOutlet weak var thumbnailImageView: UIImageView!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func reload(product: Product){
        subtitleLabel.text = product.conditionTag
        titleLabel.text = product.prettyTitle
    }
}
