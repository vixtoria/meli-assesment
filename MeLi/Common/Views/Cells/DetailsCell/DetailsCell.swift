//
//  DetailsCell.swift
//  MeLi
//
//  Created by Victoria Rodriguez on 23/2/23.
//

import Foundation
import UIKit

class DetailsCell: BaseCell {

    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var attributesTableView: UITableView!
    @IBOutlet weak var attributesTableViewHeight: NSLayoutConstraint!
        
    var attributes: [Attribute] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        attributesTableView.delegate = self
        attributesTableView.dataSource = self
        attributesTableView.separatorStyle = .none
        attributesTableView.rowHeight = 80
    }
    
    func reload(product: Product) {
        priceLabel.text = product.priceTag
        
        if let attributes = product.attributes {
            self.attributes = Array(attributes.prefix(upTo: attributes.count > 10 ? 10 : attributes.count))
            self.attributesTableViewHeight.constant = CGFloat(self.attributes.count * 80)
            self.attributesTableView.reloadData()
        } else {
            self.attributesTableViewHeight.constant = 0
        }
    }
}

extension DetailsCell: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.attributes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithRegistration(type: DetailsAttributeCell.self, indexPath: indexPath)
        
        let attribute = self.attributes[indexPath.row]
        cell.reload(attribute: attribute)
        
        return cell
    }
}
