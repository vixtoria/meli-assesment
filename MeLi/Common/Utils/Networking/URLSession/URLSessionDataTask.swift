import Foundation

extension URLSessionTask: NetworkManagerSessionTask {
	
    public var identifier: Int {
        return self.taskIdentifier
    }
    
    public var beginDate : Date? {
        get {
            return self.earliestBeginDate
        }
        
        set {
            self.earliestBeginDate = newValue
        }
    }
    
    public func resumeTask() {
		self.resume()
	}
	
}
