import Foundation

public struct NetworkErrorDetail<T>: Error {
    public let error: NetworkError
    public let detail: T?
}

struct IgnoreDetail: Decodable {
    
}
