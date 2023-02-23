//
//  ReusableView.swift
//  MeLi
//
//  Created by Victoria Rodriguez on 20/2/23.
//

import UIKit

protocol ReusableView {
    static var reuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
