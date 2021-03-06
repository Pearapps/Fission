//
//  CollectionType.swift
//  Fission
//
//  Created by Kenneth Parker Ackerson on 12/15/15.
//  Copyright © 2015 Kenneth Ackerson. All rights reserved.
//

public extension CollectionType {
    public func apply<T> (transforms: [Self.Generator.Element -> T]) -> [T] {
        return transforms.flatMap { return self.map($0) }
    }
}

public func <*> <T, U: CollectionType> (transforms: [U.Generator.Element -> T], collection: U) -> [T] {
    return collection.apply <| transforms
}

public func <^> <T, U, C: CollectionType where C.Generator.Element == T> (@noescape transform: T throws -> U, collection: C) rethrows -> [U] {
    return try collection.map(transform)
}
