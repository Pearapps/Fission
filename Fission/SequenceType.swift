//
//  SequenceType.swift
//  Fission
//
//  Created by Kenneth Parker Ackerson on 12/15/15.
//  Copyright © 2015 Kenneth Ackerson. All rights reserved.
//

public func >>- <T, S: SequenceType, U: SequenceType where U.Generator.Element == T> (sequence: U, transform: T throws -> S) rethrows -> [S.Generator.Element] {
    return try sequence.flatMap(transform)
}

public func -<< <T, S: SequenceType, U: SequenceType where U.Generator.Element == T> (transform: T throws -> S, sequence: U) rethrows -> [S.Generator.Element] {
    return try sequence.flatMap(transform)
}
