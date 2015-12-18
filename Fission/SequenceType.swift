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

/**
 Removes any optionals in a sequence.
 
 - parameter sequence: The sequence to remove optionals from.
 
 - returns: An array without optionals inside of it.
 */
public func compact<T, U: SequenceType where U.Generator.Element == T?> (sequence: U) -> [T] {
    return sequence.flatMap { return $0 }
}

public func -<< <T, S: SequenceType, U: SequenceType where U.Generator.Element == T> (transform: T throws -> S, sequence: U) rethrows -> [S.Generator.Element] {
    return try sequence.flatMap(transform)
}
