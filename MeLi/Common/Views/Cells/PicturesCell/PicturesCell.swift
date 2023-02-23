//
//  PicturesCell.swift
//  MeLi
//
//  Created by Victoria Rodriguez on 23/2/23.
//

import Foundation
import UIKit

class PicturesCell: BaseCell {
    
    @IBOutlet weak var picturesView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func reload(pictures: [Picture]?){
        self.picturesView.subviews.forEach({ $0.removeFromSuperview() })
        
        if let productPictures = pictures {
            let urls = productPictures.compactMap({ URL(string: $0.url ?? "") })
            setup(pictures: urls)
        } else {
            let imageView = UIImageView(image: UIImage(named: "default-image.png"))
            imageView.contentMode = .scaleAspectFill
            self.picturesView.addSubview(imageView)
        }
    }
    
    func setup(pictures: [URL]) {
        lazy var carousel = Carousel(frame: .zero, urls: pictures)
        self.picturesView.addSubview(carousel)
        carousel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            carousel.topAnchor.constraint(equalTo: self.picturesView.topAnchor),
            carousel.bottomAnchor.constraint(equalTo: self.picturesView.bottomAnchor),
            carousel.leadingAnchor.constraint(equalTo: self.picturesView.leadingAnchor),
            carousel.trailingAnchor.constraint(equalTo: self.picturesView.trailingAnchor)
        ])
    }
}
