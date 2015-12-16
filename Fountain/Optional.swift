//
//  Optional.swift
//  Fountain
//
//  Created by Kenneth Parker Ackerson on 12/15/15.
//  Copyright © 2015 Kenneth Ackerson. All rights reserved.
//

/**
`flatMap`s over an optional.

- parameter optional:  The optional to `flatMap` over.
- parameter transform: The function that transforms a concrete T to an optional U.

- throws: Rethrows from `flatMap`.

- returns: `nil` if `self` is nil, `f(self!)` otherwise.
*/
public func >>- <T, U> (optional: T?, @noescape transform: T throws -> U?) rethrows -> U? {
    return try optional.flatMap(transform)
}

/**
 `flatMap`s over an optional.
 
 - parameter transform: The function that transforms a concrete T to an optional U.
 - parameter optional:  The optional to `flatMap` over.

 - throws: Rethrows from `flatMap`.
 
 - returns: `nil` if `self` is nil, `f(self!)` otherwise.
 */
public func -<< <T, U> (@noescape transform: T throws -> U?, optional: T?) rethrows -> U? {
    return try optional.flatMap(transform)
}

/**
`map`s over an optional.
 
 - parameter transform: A function that transforms a concrete T to a concrete U.
 - parameter optional:  The optional to map over.
 
 - throws: Rethrows from `map`.
 
 - returns: `nil` if `self == nil`. Otherwise, returns `f(self!)`.
 */
public func <^> <T, U> (@noescape transform: T throws -> U, optional: T?) rethrows -> U? {
    return try optional.map(transform)
}

public extension Optional {
    
    /**
     Applies an optional function to self.
     
     - parameter transform: A function that transforms a concrete `Wrapped` to concrete `T`.
     
     - returns: If `self` or the transform function are `nil` this returns `nil`. Returns an optional type `T`.
     */
    func apply<T> (transform: (Wrapped -> T)?) -> T? {
        return transform.flatMap {
            self.map($0)
        }
    }
}

/**
 Applies an optional function to an optional.
 
 - parameter transform: A function that transforms a concrete `T` to concrete `U`.
 - parameter optional:  The optional to apply the transform function to.
 
 - returns: If `self` or the transform function are `nil` this returns `nil`. Returns an optional type `U`.
 */
public func <*><T, U> (transform: (T -> U)?, optional: T?) -> U? {
    return optional.apply <| transform
}
