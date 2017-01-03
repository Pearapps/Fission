//
//  SequenceType.swift
//  Fission
//
//  Created by Kenneth Parker Ackerson on 12/15/15.
//  Copyright © 2015 Kenneth Ackerson. All rights reserved.
//

public func >>- <T, S: Sequence, U: Sequence> (sequence: U, transform: (T) throws -> S) rethrows -> [S.Iterator.Element] where U.Iterator.Element == T {
    return try sequence.flatMap(transform)
}

/**
 Removes any optionals in a sequence.
 
 - parameter sequence: The sequence to remove optionals from.
 
 - returns: An array without optionals inside of it.
 */
public func compact<T, U: Sequence> (_ sequence: U) -> [T] where U.Iterator.Element == T? {
    return sequence.flatMap { return $0 }
}

public func -<< <T, S: Sequence, U: Sequence> (transform: (T) throws -> S, sequence: U) rethrows -> [S.Iterator.Element] where U.Iterator.Element == T {
    return try sequence.flatMap(transform)
}
