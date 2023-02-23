//
//  MainCoordinator.swift
//  MeLi
//
//  Created by Victoria Rodriguez on 18/2/23.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    
    var rootViewController: UINavigationController
    var childsCoordinators: [Coordinator] = []
    
    //unowned let navigationController:UINavigationController
    
    init(navigationController: UINavigationController) {
        self.rootViewController = navigationController
        self.rootViewController.interactivePopGestureRecognizer?.isEnabled = false
        
        self.rootViewController.navigationBar.backgroundColor = UIColor(named: "AccentColor")
        self.rootViewController.navigationBar.tintColor = UIColor(named: "TextColor")
        
        self.rootViewController.isNavigationBarHidden = true
    }
    
    func start() {
        let viewController = MainRouter.createModule(delegate: self)
        rootViewController.pushViewController(viewController, animated: true)
    }
}

extension MainCoordinator: MainViewControllerDelegate {

    func goToProduct(product: String) {
        let viewController = ProductRouter.createModule(delegate: self, product: product)
        rootViewController.pushViewController(viewController, animated: true)
        
    }
}

extension MainCoordinator: ProductViewControllerDelegate {
    
}
