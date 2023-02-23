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
                print("Error")
                print(error)
                
                if error == .noNetwork {
                    self.presenter?.didFinishGettingProductsWithErrors(error: "Please check your internet connection and try again")
                }
                
                self.presenter?.didFinishGettingProducts(results: [])
            }
        }
        
        
//        let params = EditPost(FIIDEMPLEADO: SocialNetworkConstant.shared.userId,
//                              post_id: postId,
//                              content: content)
//
//        let request = snService.getRequestWP(method: .publicationsEdit, params: params)
//        snService.makeRequest(request: request) { (data, error) in
//            if let error = error {
//                self.presenter?.didFinishEditingPostWithErrors(error: error)
//            } else {
//                do {
//                    let json = try JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed) as? [String: Any]
//                    if let message = json?["message"] as? String, message == "Edited Post" {
//                        let realm = try Realm()
//                        let post = realm.object(ofType: PublicationRealm.self, forPrimaryKey: postId)
//
//                        try realm.write {
//                            post?.content = content
//                        }
//
//                        self.presenter?.didFinishEditingPost()
//                    } else {
//                        self.presenter?.didFinishEditingPostWithErrors(error: SocialNetworkErrors.ResponseError)
//                    }
//                } catch {
//                    self.presenter?.didFinishEditingPostWithErrors(error: SocialNetworkErrors.ResponseError)
//                }
//            }
//        }
    }
}
