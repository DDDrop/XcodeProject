//
//  LastKnownFileType.swift
//  xcp
//
//  Created by kingkong999yhirose on 2016/12/23.
//  Copyright © 2016年 kingkong999yhirose. All rights reserved.
//

import Foundation

enum LastKnownFileType {
    case resourceFile(String)
    case sourceCode(String)
    
    init(fileName: String) {
        guard let fileExtension = fileName.components(separatedBy: ".").last else {
            fatalError(assertionMessage(description: "unexpected fileExtension error"))
        }
        
        switch fileExtension {
        case "xib", "storyboard":
            self = .resourceFile("file.\(fileExtension)")
        case "h", "m", "swift":
            self = .sourceCode("sourcecode.\(fileExtension)")
        default:
            fatalError(assertionMessage(description: "unknown fileExtension type"))
        }
    }
    
    var value: String {
        switch self {
        case .resourceFile(let string):
            return string
        case .sourceCode(let string):
            return string
        }
    }
}
    
