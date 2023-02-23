//
//  DetailsAttributeCell.swift
//  MeLi
//
//  Created by Victoria Rodriguez on 23/2/23.
//

import Foundation
import UIKit

class DetailsAttributeCell: BaseCell {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func reload(attribute: Attribute){
        descriptionLabel.text = attribute.description
    }
}
