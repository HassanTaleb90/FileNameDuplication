//
//  FileNameDuplication.swift
//
//  Created by Hassan Taleb on 27/12/2024.
//
import Foundation

public class FileNameDuplication {
    
    public var existingFiles: [String]

    public init(existingFiles: [String]) {
        self.existingFiles = existingFiles
    }

    private func parseFilename(_ name: String) -> (base: String, count: Int) {
        let regexPattern = " copy( \\d+)?$"
        
        if let match = name.range(of: regexPattern, options: .regularExpression) {
            let base = name[..<match.lowerBound].trimmingCharacters(in: .whitespaces)
            let count = name[match]
                .split(separator: " ")
                .last
                .flatMap { Int($0) } ?? 1
            return (base, count)
        } else {
            return (name, 0)
        }
    }

    public func generateUniqueFilename(originalName: String) -> String {
        var (base, count) = parseFilename(originalName)
        
        var newFilename: String
        
        if count == 0 {
            newFilename = "\(base) copy"
        } else {
            newFilename = "\(base) copy \(count + 1)"
        }
        
        while existingFiles.contains(newFilename) {
            count += 1
            newFilename = "\(base) copy \(count + 1)"
        }
        
        return newFilename
    }
}
