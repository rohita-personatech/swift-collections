//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift Collections open source project
//
// Copyright (c) 2022 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
//
//===----------------------------------------------------------------------===//

extension PersistentSet: Hashable {
  @inlinable
  public func hash(into hasher: inout Hasher) {
    let copy = hasher
    let seed = copy.finalize()

    var hash = 0
    for member in self {
      hash ^= member._rawHashValue(seed: seed)
    }
    hasher.combine(hash)
  }
}
