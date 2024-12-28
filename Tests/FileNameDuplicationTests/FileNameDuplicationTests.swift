import Testing
@testable import FileNameDuplication

@Test func testGenerateUniqueFilename() async throws {
    let allExistingFiles = [
        "test",
        "test copy",
        "test copy 3",
        "test copy 99"
    ]
    
    let fileNameDuplication = FileNameDuplication(existingFiles: allExistingFiles)
    
    let result1 = fileNameDuplication.generateUniqueFilename(originalName: "test")
    #expect(result1 == "test copy 2")
    
    let result2 = fileNameDuplication.generateUniqueFilename(originalName: "test 99")
    #expect(result2 == "test 99 copy")
    
    let result3 = fileNameDuplication.generateUniqueFilename(originalName: "test copy")
    #expect(result3 == "test copy 2")
    
    let result4 = fileNameDuplication.generateUniqueFilename(originalName: "test copy 1")
    #expect(result4 == "test copy 2")
    
    let result5 = fileNameDuplication.generateUniqueFilename(originalName: "test copy 2")
    #expect(result5 == "test copy 4")
    
    let result6 = fileNameDuplication.generateUniqueFilename(originalName: "test copy 3")
    #expect(result6 == "test copy 4")
    
    let result7 = fileNameDuplication.generateUniqueFilename(originalName: "test copy 98")
    #expect(result7 == "test copy 100")
    
    let result8 = fileNameDuplication.generateUniqueFilename(originalName: "test copy 99")
    #expect(result8 == "test copy 100")
}


