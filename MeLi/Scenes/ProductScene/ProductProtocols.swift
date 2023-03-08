//
//  ProductProtocols.swift
//  MeLi
//
//  Created by Victoria Rodriguez on 21/2/23.
//

import Foundation

//MARK: Router -
protocol ProductRouterProtocol: AnyObject {

}

//MARK: Presenter -
protocol ProductPresenterProtocol: AnyObject {
    
    //MARK: - Product
    func getProduct(id: String)
    func didFinishGettingProduct(product: Product)
    func didFinishGettingProductWithErrors(error: String)

}

//MARK: Interactor -
protocol ProductInteractorProtocol: AnyObject {
    
    var presenter: ProductPresenterProtocol?  { get set }

    //MARK: - Product
    func product(id: String)
}

//MARK: View -
protocol ProductViewProtocol: AnyObject {
    
    var presenter: ProductPresenterProtocol?  { get set }
    
    //MARK: - Product
    func didFinishGettingProduct(product: Product)
    func didFinishGettingProductWithErrors(error: String)
}
