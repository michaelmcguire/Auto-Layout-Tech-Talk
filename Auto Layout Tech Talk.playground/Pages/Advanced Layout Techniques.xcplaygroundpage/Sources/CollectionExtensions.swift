import Foundation

public extension CollectionType {
  /// An array of the adjacent pairs of elements in the collection.
  ///
  /// If self is [A, B, C, D], then pairs is [(A, B), (B, C), (C, D)]
  var pairs: [(Generator.Element, Generator.Element)] {
    var result: [(Generator.Element, Generator.Element)] = []
    
    for index in indices {
      let next = index.successor()
      if next.distanceTo(endIndex) > 0 {
        result.append((self[index], self[next]))
      }
    }
    
    return result
  }
}