//
//  ProductCell.swift
//  MeLi
//
//  Created by Victoria Rodriguez on 20/2/23.
//

import UIKit
import SDWebImage

class ProductCell: BaseCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func reload(product: Product){
        titleLabel.text = product.prettyTitle
        priceLabel.text = product.priceTag
        if let thumbnail = product.thumbnail {
            thumbnailImageView.sd_setImage(with: URL(string: thumbnail), placeholderImage: UIImage(named: "default-image.png"))
        }
    }
}
