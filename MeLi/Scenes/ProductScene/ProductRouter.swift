//
//  ProductRouter.swift
//  MeLi
//
//  Created by Victoria Rodriguez on 21/2/23.
//

import UIKit

public class ProductRouter: ProductRouterProtocol {

    weak var viewController: UIViewController?
    weak var coordinator: ProductViewControllerDelegate?
    
    static func createModule(delegate: ProductViewControllerDelegate, product: String) -> UIViewController {
        let view = ProductViewController.loadFromNib()
        let interactor = ProductInteractor()
        let router = ProductRouter()
        let presenter = ProductPresenter(interface: view, interactor: interactor, router: router)
        
        view.productId = product
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        router.coordinator = delegate
        
        return view
    }
}

protocol ProductViewControllerDelegate: AnyObject {
    
}
