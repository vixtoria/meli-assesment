import Foundation

public protocol NetworkManagerSessionTask {
    
    var identifier: Int {get}
    
    var beginDate: Date? {get set}
	
	func resumeTask()
	
}
