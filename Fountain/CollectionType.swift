//
//  CollectionType.swift
//  Fountain
//
//  Created by Kenneth Parker Ackerson on 12/15/15.
//  Copyright © 2015 Kenneth Ackerson. All rights reserved.
//

infix operator >>- { }

func >>-<T, U, C: CollectionType where C.Generator.Element == T>(@noescape transform: T throws -> U, collection: C) rethrows -> [U] {
    return try collection.map(transform)
}
