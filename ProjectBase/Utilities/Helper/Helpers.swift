//
//  Helpers.swift
//  ProjectBase
//
//  Created by Motivator on 25/01/2018.
//  Copyright © 2018 Motivator. All rights reserved.
//

import Foundation

//MARK: - Logs
public func Log(_ error: Error) {
    Log(error.localizedDescription)
}

public func Log(_ message: String, function: String = #function, file: String = #file, line: Int = #line) {
    #if DEBUG
        let fileName = file.components(separatedBy: "/").last != nil ? "[\(file.components(separatedBy: "/").last!)]" : ""
        print("****\(fileName)[\(function)][\(line)]:\r\(message)\n")
    #endif
}

func DPrint<T>(_ object: @autoclosure () -> T, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
    #if DEBUG
        let value = object()
        let fileURL = NSURL(string: file)?.lastPathComponent ?? "Unknown file"
        let queue = Thread.isMainThread ? "UI" : "BG"
        
        print("<\(queue)> \(fileURL) \(function)[\(line)]: " + String(reflecting: value))
    #endif
}

//MARK: -
//The server time format - 2016-06-07T12:24:35.732Z
var DefaultISO8601Formatter: DateFormatter = {
    let dateFormatter = DateFormatter.init()
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    
    return dateFormatter
}()

