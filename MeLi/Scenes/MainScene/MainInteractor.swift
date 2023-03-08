//
//  MainInteractor.swift
//  MeLi
//
//  Created by Victoria Rodriguez on 18/2/23.
//

import Foundation
import UIKit

public class MainInteractor: MainInteractorProtocol {

    weak var presenter: MainPresenterProtocol?
    
    //MARK: - Properties
    private var networkManager = URLSessionNetworkManager()
    
    //MARK: - Products
    func products(query: String, page: Int) {
        networkManager.request(type: ProductSearchResponse.self, endpoint: ProductsEndpoint.search(Sites.UY, query, Constants.pageLimit, page * Constants.pageLimit)) { result in
            switch result {
            case .success(let response):
                guard let results = response.results else {
                    return
                }
                  
                self.presenter?.didFinishGettingProducts(results: results)
            case .failure(let error):
                if error == .noNetwork {
                    self.presenter?.didFinishGettingProductsWithErrors(error: "Por favor revisa tu conexión y vuelve a intentarlo")
                }
                
                self.presenter?.didFinishGettingProducts(results: [])
            }
        }
    }
}
