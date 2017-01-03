//
//  CollectionType.swift
//  Fission
//
//  Created by Kenneth Parker Ackerson on 12/15/15.
//  Copyright © 2015 Kenneth Ackerson. All rights reserved.
//

public extension Collection {
    public func apply<T> (_ transforms: [(Self.Iterator.Element) -> T]) -> [T] {
        return transforms.flatMap { return self.map($0) }
    }
}

public func <*> <T, U: Collection> (transforms: [(U.Iterator.Element) -> T], collection: U) -> [T] {
    return collection.apply <| transforms
}

public func <^> <T, U, C: Collection> (transform: (T) throws -> U, collection: C) rethrows -> [U] where C.Iterator.Element == T {
    return try collection.map(transform)
}
