import AppleICNS
import ArgumentParser
import Foundation

/// A command-line tool to extract an extended attribute data set from a file and save it as a
/// binary file of the user's choice.
@main
struct AttrExport: ParsableCommand {
  /// The name of the extended attribute to extract.
  @Argument(help: "The name of the extended attribute.")
  var attrName: String
  
  /// The name of the file to read the extended attribute from.
  @Argument(help: "The name of the file to read from.")
  var srcName: String
  
  /// The name of the file to save the extracted attribute data to.
  @Argument(help: "The name of the file to save attribute data to.")
  var dstName: String
  
  /// A flag indicating whether to allow overwriting an existing output file.
  @Flag(help: "When present, this flag will allow overwrite of existing output.")
  var overwrite: Bool = false
  
  /// Extracts the specified extended attribute data set from a file and saves it to another file.
  mutating func run() throws {
    let fileManager = FileManager.default
    
    // Check if the source file exists
    guard fileManager.fileExists(atPath: srcName) else {
      throw ValidationError("Cannot find the file to read an attribute from")
    }
    
    // Check if the destination file exists when overwrite is not allowed
    guard !fileManager.fileExists(atPath: dstName) && !overwrite else {
      throw ValidationError("A file with the same destination name exists already")
    }
    
    // Export the specified attribute data to the destination file
    ResourceFork.exportAttribute(
      fromFile: srcName,
      toFile: dstName,
      named: attrName
    )
    
    // Exit with success code
    throw ExitCode(0)
  }
}
