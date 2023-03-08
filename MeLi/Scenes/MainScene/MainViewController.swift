//
//  MainViewController.swift
//  MeLi
//
//  Created by Victoria Rodriguez on 18/2/23.
//

import Foundation
import UIKit

class MainViewController: BaseViewController {
    
    //MARK: - Properties
    var presenter: MainPresenterProtocol?

    var page: Int = 0
    var isLastPage: Bool = false

    private var products: [Product] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    @IBOutlet weak var searchTextField: StyledTextFieldWithImage!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.estimatedRowHeight = 140
            tableView.rowHeight = UITableView.automaticDimension
        }
    }
    
    //MARK: - Life cycle
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = ""
        displaySpinner()
        self.presenter?.getProducts(query: searchTextField.text ?? "", page: page)
    }
    
    //MARK: - Methods
    func loadMore() {
        if isLastPage { return }
        page+=1
        self.presenter?.getProducts(query: searchTextField.text ?? "", page: page)
    }
    
    func hideLoading() {
        self.tableView.tableFooterView?.isHidden = true
    }
    
    //MARK: - Actions
    @IBAction func searchFieldChanged(_ sender: Any) {
        isLastPage = false
        page = 0
        hideLoading()
        tableView.setContentOffset(.zero, animated: false)
        self.presenter?.getProducts(query: searchTextField.text ?? "", page: page)
    }
}

//MARK: - Protocols
extension MainViewController: MainViewProtocol {
    
    func didFinishGettingProducts(results: [Product]) {
        if (page == 0) {
            products = []
        }
        
        hideSpinner()
        if results.isEmpty {
            isLastPage = true
            hideLoading()
            return
        }
        products.append(contentsOf: results)
    }
    
    func didFinishGettingProductsWithErrors(error: String) {
        if (page == 0) {
            products = []
            hideLoading()
        }
        hideSpinner()
    }

}

//MARK: - TableView
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = MainTableViewSection(rawValue: section)!
        
        switch section {
        case .EmptySection:
            return (products.count != 0 || searchTextField.text == "") ? 0 : 1
        case .ProductSection:
            return products.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = MainTableViewSection(rawValue: indexPath.section)!
        
        switch section {
        case .EmptySection:
            return tableView.dequeueReusableCellWithRegistration(type: EmptyCell.self, indexPath: indexPath)
        case .ProductSection:
            let cell = tableView.dequeueReusableCellWithRegistration(type: ProductCell.self, indexPath: indexPath)
            
            let product = self.products[indexPath.row]
            cell.reload(product: product)
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = MainTableViewSection(rawValue: indexPath.section)
        if section == .EmptySection { return }
        
        guard let productId = self.products[indexPath.row].id else {
            return
        }
        self.presenter?.presentProduct(id: productId)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if products.isEmpty { return }
        let section = MainTableViewSection(rawValue: indexPath.section)
        if section == .EmptySection { return }
        
        let lastSectionIndex = tableView.numberOfSections - MainTableViewSection.count
        let lastRowIndex = tableView.numberOfRows(inSection: lastSectionIndex) - 1
        if indexPath.section ==  lastSectionIndex && indexPath.row == lastRowIndex {
            let spinner = UIActivityIndicatorView(style: .medium)
            spinner.startAnimating()
            spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(44))

            self.tableView.tableFooterView = spinner
            self.tableView.tableFooterView?.isHidden = false
            
            self.loadMore()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return MainTableViewSection.count
    }
}

enum MainTableViewSection: Int {
    case ProductSection
    case EmptySection
    static var count = 2
}
