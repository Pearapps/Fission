//
//  Mutation.swift
//  Fission
//
//  Created by Kenneth Parker Ackerson on 12/15/15.
//  Copyright © 2015 Kenneth Ackerson. All rights reserved.
//

/// Based on https://twitter.com/jckarter/status/675445367542968320
public func applied<T, U> (transform: inout T -> U -> ()) -> T -> U -> T {
    return { a in
        { b in
            var mutable = a
            transform(&mutable)(b)
            return mutable
        }
    }
}

/**
 Transforms a mutating function and a receiver into a function that returns a value.
 
 This allows you to do things like this
 
 let appended = Array.appendContentsOf <-> ["first"] <| ["second"]
 // appended is equal to `["first", "second"]`
 
 - parameter f: The mutating func to be applied.
 - parameter t: The reciever of the mutating function
 
 - returns: A function that returns
 */
public func <-><T, U>(f: inout T -> U -> (), t: T) -> U -> T {
    return t |> (applied <| f)
}
