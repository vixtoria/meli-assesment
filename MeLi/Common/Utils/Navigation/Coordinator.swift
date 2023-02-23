//
//  Coordinator.swift
//  MeLi
//
//  Created by Victoria Rodriguez on 18/2/23.
//

import UIKit

protocol Coordinator {
    
    var rootViewController: UINavigationController {get set}
    var childsCoordinators: [Coordinator] { set get }
    func start()
    
}
