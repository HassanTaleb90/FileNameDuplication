//
//  FileNameDuplication.swift
//
//  Created by Hassan Taleb on 27/12/2024.
//
import Foundation

class FileNameDuplication {
    
    var existingFiles: [String]
    
    init(existingFiles: [String]) {
        self.existingFiles = existingFiles
    }
     
    private func parseFilename(_ name: String) -> (base: String, count: Int) {
        let regexPattern = " copy( \\d+)?$"
        
        // Match "copy" or "copy X" at the end of the string
        if let match = name.range(of: regexPattern, options: .regularExpression) {
            // Extract the base part of the filename (before "copy" or "copy X")
            let base = name[..<match.lowerBound].trimmingCharacters(in: .whitespaces)
            
            // Extract the count from "copy X" (or default to 1 if no number is found)
            let count = name[match]
                .split(separator: " ")
                .last
                .flatMap { Int($0) } ?? 1  // Default to 1 if "copy" has no number (i.e. treat "copy" as "copy 1")
            
            return (base, count)
        } else {
            // No "copy" found, treat as the base filename with count 0
            return (name, 0)
        }
    }
    
    func generateUniqueFilename(originalName: String) -> String {
        var (base, count) = parseFilename(originalName)
        
        var newFilename: String
        
        // If no "copy" was found in the name (e.g. "test"), start with "copy"
        if count == 0 {
            newFilename = "\(base) copy"  // "test" -> "test copy"
        } else {
            // If there's a "copy", treat it as "copy 1" and increment
            newFilename = "\(base) copy \(count + 1)"  // "test copy" -> "test copy 2"
        }
        
        // Ensure the generated filename is unique
        while existingFiles.contains(newFilename) {
            count += 1
            newFilename = "\(base) copy \(count + 1)"
        }
        
        return newFilename
    }
}
