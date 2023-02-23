//
//  MainPresenter.swift
//  MeLi
//
//  Created by Victoria Rodriguez on 18/2/23.
//

import UIKit

public class MainPresenter: MainPresenterProtocol {

    weak private var view: MainViewProtocol?
    var interactor: MainInteractorProtocol?
    private let router: MainRouterProtocol

    init(interface: MainViewProtocol, interactor: MainInteractorProtocol?, router: MainRouterProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    //MARK: - Products
    func getProducts(query: String, page: Int) {
        interactor?.products(query: query, page: page)
    }
    
    func didFinishGettingProducts(results: [Product]) {
        DispatchQueue.main.async {
            self.view?.didFinishGettingProducts(results: results)
        }
    }
    
    func didFinishGettingProductsWithErrors(error: String) {
        DispatchQueue.main.async {
            self.view?.didFinishGettingProductsWithErrors(error: error)
        }
    }
    
    func presentProduct(id: String) {
        router.showProductDetail(id: id)
    }
}
