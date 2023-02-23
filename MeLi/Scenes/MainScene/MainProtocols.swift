//
//  MainProtocols.swift
//  MeLi
//
//  Created by Victoria Rodriguez on 18/2/23.
//

import Foundation

//MARK: Router -
protocol MainRouterProtocol: AnyObject {
    func showProductDetail(id: String)
}

//MARK: Presenter -
protocol MainPresenterProtocol: AnyObject {
    
    //MARK: - Products
    func getProducts(query: String, page: Int)
    func didFinishGettingProducts(results: [Product])
    func didFinishGettingProductsWithErrors(error: String)

    func presentProduct(id: String)
}

//MARK: Interactor -
protocol MainInteractorProtocol: AnyObject {
    
    var presenter: MainPresenterProtocol?  { get set }
    
    //MARK: - Products
    func products(query: String, page: Int)
}

//MARK: View -
protocol MainViewProtocol: AnyObject {
    
    var presenter: MainPresenterProtocol?  { get set }
    
    //MARK: - Products
    func didFinishGettingProducts(results: [Product])
    func didFinishGettingProductsWithErrors(error: String)
}
