//
//  MainRouter.swift
//  MeLi
//
//  Created by Victoria Rodriguez on 18/2/23.
//

import UIKit

public class MainRouter: MainRouterProtocol {

    weak var viewController: UIViewController?
    weak var coordinator: MainViewControllerDelegate?
    
    static func createModule(delegate: MainViewControllerDelegate) -> UIViewController {
        let view = MainViewController.loadFromNib()
        let interactor = MainInteractor()
        let router = MainRouter()
        let presenter = MainPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        router.coordinator = delegate
        
        return view
    }
    
    //MARK: - ShowProductDetail
    func showProductDetail(id: String) {
        //let vc = DetailPostRouter.createModule() as! DetailPostViewController
        //vc.postId = postId
        //navController?.pushViewController(vc, animated: true)
        coordinator?.goToProduct(product: id)
    }
}

protocol MainViewControllerDelegate: AnyObject {
    
    func goToProduct(product: String)
}
