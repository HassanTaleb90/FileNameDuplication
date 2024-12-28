# FileNameDuplication

**FileNameDuplication** is a Swift utility that implements the same algorithm used by Apple to automatically handle filename duplicates. It generates unique filenames by adding a "copy" suffix (e.g., `test` becomes `test copy`, `test copy` or `test copy 1` becomes `test copy 2`, `test copy 2` becomes `test copy 3`), helping to prevent filename clashes when saving files.

## Features

- **Automatically generates unique filenames**: Adds "copy" or increments the copy number to prevent duplicates (e.g., `test copy`, `test copy 2`, `test copy 3`).
- **Ensures uniqueness**: The algorithm checks if the generated filename already exists in the list of existing files, and if so, increments the copy number until a unique name is found.
- **Follows Apple's filename duplication algorithm**: The same approach used by macOS to handle duplicate filenames in a directory.
- **Simple to use**: A straightforward utility for managing file names without manual intervention.

## Usage

```swift
import FileNameDuplication

let allExistingFiles = [
    "test",
    "test copy",
    "test copy 3",
    "test copy 99"
]

let originalFilenames = [
    "test",
    "test 99",
    "test copy",
    "test copy 1",
    "test copy 2",
    "test copy 3",
    "test copy 98",
    "test copy 99"
]

let fileNameDuplication = FileNameDuplication(existingFiles: allExistingFiles)
for originalFilename in originalFilenames {
    let newFilename = fileNameDuplication.generateUniqueFilename(originalName: originalFilename)
    print("Original: \(originalFilename) -> New: \(newFilename)")
}
```

## Example Output
```
Original: test -> New: test copy 2
Original: test 99 -> New: test 99 copy
Original: test copy -> New: test copy 2
Original: test copy 1 -> New: test copy 2
Original: test copy 2 -> New: test copy 4
Original: test copy 3 -> New: test copy 4
Original: test copy 98 -> New: test copy 100
Original: test copy 99 -> New: test copy 100
```
## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Contributing

Feel free to fork the repository, open issues, or submit pull requests. Contributions are always welcome!
