import Foundation

public protocol NetworkManagerSession {
	
    typealias DataTaskResult = (Data?, URLResponse?, Error?) -> ()
	
	func dataTask(request: URLRequest, completionHandler: @escaping DataTaskResult) -> NetworkManagerSessionTask
	
}
