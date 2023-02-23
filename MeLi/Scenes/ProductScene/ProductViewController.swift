//
//  ProductViewController.swift
//  MeLi
//
//  Created by Victoria Rodriguez on 21/2/23.
//

import Foundation
import UIKit

class ProductViewController: BaseViewController {
    
    //MARK: - Properties
    var presenter: ProductPresenterProtocol?
    
    var productId: String?
    
    private var product: Product? {
        didSet {
            tableView.reloadData()
        }
    }
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.estimatedRowHeight = 350
            tableView.rowHeight = UITableView.automaticDimension
            tableView.allowsSelection = false
            tableView.separatorStyle = .none
        }
    }
    
    //MARK: - Life cycle
    override public func viewDidLoad() {
        super.viewDidLoad()
                
        self.title = "Detalles"
        
        let acceptCompletion = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
            return
        }
        guard let id = productId else {
            UIAlertView.showAcceptAlert(acceptTittle: "Aceptar", title: "¡Lo sentimos!", message: "Algo salío mal, por favor inténtalo nuevamente.", viewController: self, completion: acceptCompletion)
            return
        }
        displaySpinner()
        self.presenter?.getProduct(id: id)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    //MARK: - Methods
//    func setup() {
//        self.title = "Detalles"
//
////        let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
////        navigationItem.backBarButtonItem = backButton
////        navigationItem.backButtonDisplayMode = .generic
//
//        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
//        navigationItem.backBarButtonItem = backBarButtonItem
//        navigationItem.backButtonTitle = ""
//    }
    
}

//MARK: - Protocols
extension ProductViewController: ProductViewProtocol {
    
    func didFinishGettingProduct(product: Product) {
        self.product = product
        hideSpinner()
    }
    
    func didFinishGettingProductWithErrors(error: String) {
        hideSpinner()
    }

}

//MARK: - TableView
extension ProductViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let section = ProductTableViewSection(rawValue: indexPath.section)!
//
//        switch section {
//        case .HeaderSection:
//            return 100
//        case .PicturesSection:
//            return 350
//        case .DetailsSection:
//            return 150
//        }
//    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = ProductTableViewSection(rawValue: indexPath.section)!

        switch section {
        case .HeaderSection:
            let cell = tableView.dequeueReusableCellWithRegistration(type: HeaderCell.self, indexPath: indexPath)

            if let product = product {
                cell.reload(product: product)
            }
            
            return cell
        case .PicturesSection:
            let cell = tableView.dequeueReusableCellWithRegistration(type: PicturesCell.self, indexPath: indexPath)

            cell.reload(pictures: product?.pictures)
            
            return cell
        case .DetailsSection:
            let cell = tableView.dequeueReusableCellWithRegistration(type: DetailsCell.self, indexPath: indexPath)
            
            if let product = product {
                cell.reload(product: product)
            }
            
            return cell
        }
    }

//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let section = MainTableViewSection(rawValue: indexPath.section)
//        if section == .EmptySection { return }
//
//        guard let productId = self.products[indexPath.row].id else {
//            return
//        }
//        self.presenter?.presentProduct(id: productId)
//    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return ProductTableViewSection.count
    }
}


enum ProductTableViewSection: Int {
    case HeaderSection
    case PicturesSection
    case DetailsSection
    static var count = 3
}
