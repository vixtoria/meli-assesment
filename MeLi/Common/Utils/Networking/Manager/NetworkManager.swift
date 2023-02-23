import Foundation

protocol NetworkManager {
	
	var session: NetworkManagerSession { get }
	var environment : NetworkEnvironment {get set}
	
	func request<T>(type: T.Type, endpoint: Endpoint, completion: @escaping (Result<T, NetworkError>) -> ()) where T: Decodable
	
	func request(endpoint: Endpoint, completion: @escaping (Result<Void, NetworkError>) -> ())
    
    func request<T, U>(type: T.Type, endpoint: Endpoint, completion: @escaping (Result<T, NetworkErrorDetail<U>>) -> ()) where T: Decodable, U: Decodable
    
    func request<U>(endpoint: Endpoint, completion: @escaping (Result<Void, NetworkErrorDetail<U>>) -> ()) where U: Decodable
	
}


