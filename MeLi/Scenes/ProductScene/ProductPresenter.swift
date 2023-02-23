//
//  ProductPresenter.swift
//  MeLi
//
//  Created by Victoria Rodriguez on 21/2/23.
//

import UIKit

public class ProductPresenter: ProductPresenterProtocol {
    
    weak private var view: ProductViewProtocol?
    var interactor: ProductInteractorProtocol?
    private let router: ProductRouterProtocol

    init(interface: ProductViewProtocol, interactor: ProductInteractorProtocol?, router: ProductRouterProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    //MARK: - Product
    func getProduct(id: String) {
        interactor?.product(id: id)
    }
    
    func didFinishGettingProduct(product: Product) {
        DispatchQueue.main.async {
            self.view?.didFinishGettingProduct(product: product)
        }
    }
    
    func didFinishGettingProductWithErrors(error: String) {
        DispatchQueue.main.async {
            self.view?.didFinishGettingProductWithErrors(error: error)
        }
    }

}
