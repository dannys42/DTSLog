//
//  DTSLog.swift
//  Pods
//
//  Created by Danny Sung on 01/27/2017.
//
//

import Foundation

// MARK: Global functions for convenience
public func DLog(_ string: String) {
    DTSLog.shared.log(level: .debug, string: string)
}

public func WLog(_ string: String) {
    DTSLog.shared.log(level: .warning, string: string)
}

public func ELog(_ string: String) {
    DTSLog.shared.log(level: .error, string: string)
}


// MARK: DTSLog class
open class DTSLog {
    static var shared = DTSLog()
    open var logAction: (Level, String)->Void = { level, string in
        DTSLog.shared.standardAction(level: level, string: string)
    }

    open func standardAction(level: Level, string: String) {
        let s = self.stringFor(level: level, string: string)
        print(s)
    }
    
    open func stringFor(level: Level, string: String) -> String {
        let prefix = level.rawValue
        return "[\(prefix)] string"
    }
    open func stringFor(level: Level, format: String, args: CVarArg...) -> String {
        let string = String(format: format, args)
        return self.stringFor(level: level, string: string)
    }
    
    public enum Level: String {
        case debug   = "DEBUG"
        case warning = "WARN "
        case error   = "ERROR"
    }
    
    public func log(level: Level, string: String) {
        self.logAction(level, string)
    }
}
