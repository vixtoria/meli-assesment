//
//  ProductInteractor.swift
//  MeLi
//
//  Created by Victoria Rodriguez on 21/2/23.
//

import Foundation
import UIKit

public class ProductInteractor: ProductInteractorProtocol {

    weak var presenter: ProductPresenterProtocol?
    
    //MARK: - Properties
    private var networkManager = URLSessionNetworkManager()
    
    //MARK: - Product
    func product(id: String) {
        networkManager.request(type: ProductDetailResponse.self, endpoint: ProductsEndpoint.detail(id)) { result in
            switch result {
            case .success(let response):
                guard let product = response.elements?.first?.body else {
                    return
                }
                  
                self.presenter?.didFinishGettingProduct(product: product)
            case .failure(let error):
                print("Error")
                print(error)
                
                if error == .noNetwork {
                    self.presenter?.didFinishGettingProductWithErrors(error: "Please check your internet connection and try again")
                }
                
                self.presenter?.didFinishGettingProductWithErrors(error: "Algo salío mal, por favor inténtalo nuevamente.")
            }
        }
    }
    
}
