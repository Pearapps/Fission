//
//  Sequencetype.swift
//  Fission
//
//  Created by Kenneth Parker Ackerson on 12/15/15.
//  Copyright © 2015 Kenneth Ackerson. All rights reserved.
//

public func >>- <T, S: SequenceType, U: SequenceType where U.Generator.Element == T> (collection: U, transform: T throws -> S) rethrows -> [S.Generator.Element] {
    return try collection.flatMap(transform)
}

public func -<< <T, S: SequenceType, U: SequenceType where U.Generator.Element == T> (transform: T throws -> S, collection: U) rethrows -> [S.Generator.Element] {
    return try collection.flatMap(transform)
}
