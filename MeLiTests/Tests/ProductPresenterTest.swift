//
//  ProductDetailTest.swift
//  MeLiTests
//
//  Created by Victoria Rodriguez on 24/2/23.
//

import XCTest
@testable import MeLi

class ProductDetailTest: XCTestCase {

    var interactor: MainInteractor!
    var view: MainViewController!
    var router: MainRouter!
    var presenter: MainPresenter!
    
    override func setUp() {
        super.setUp()
        
        interactor = MainInteractor()
        view = MainViewController()
        router = MainRouter()
        presenter = MainPresenter(interface: view, interactor: interactor, router: router)

    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        let expectedData = [MyModel(id: "1", name: "Test 1"), MyModel(id: "2", name: "Test 2")]

    
        let query = "test"
        let page = 1
                
        let expectation = XCTestExpectation(description: "Products search API call")
        presenter.mockedFetchDataResult = .success(expectedData)
        
        presenter.getProducts(query: query, page: page)
        
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
