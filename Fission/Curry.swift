//
//  Curry.swift
//  Fission
//
//  Created by Kenneth Parker Ackerson on 12/15/15.
//  Copyright © 2015 Kenneth Ackerson. All rights reserved.
//

/**
Transforms a function with two arguments into two functions with one argument each.

- parameter f: The function to curry.

- returns: A curried version of the provided function.
*/
public func curry<T, U, V> (_ f: @escaping (T, U) -> V) -> (T) -> (U) -> V {
    return { x in
        return {
            return f <| (x, $0)
        }
    }
}

/**
 Transforms a function that returns a function into a function that takes two arguments.
 
 - parameter f: The function to uncurry.
 
 - returns: An uncurried version of the provided function.
 */
public func uncurry<T, U, V> (_ f: @escaping (T) -> (U) -> V) -> (T, U) -> V {
    return {
        return f <| $0 <| $1
    }
}
