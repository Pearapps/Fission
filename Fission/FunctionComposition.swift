//
//  FunctionComposition.swift
//  Fission
//
//  Created by Kenneth Parker Ackerson on 12/15/15.
//  Copyright © 2015 Kenneth Ackerson. All rights reserved.
//

/**
Function composition operator.

- parameter lhs: The function on the left hand side of this operator. First function to be composed.
- parameter rhs: The function on the right hand side of this operator. Second function to be composed.

- returns: A function that transforms the first argument of the first function into the return value of the second function.
*/
public func >>> <T, U, V>(lhs: @escaping (T) -> U, rhs: @escaping (U) -> V) -> (T) -> V {
    return {
        return $0 |> lhs |> rhs
    }
}

/**
 Function composition operator.
 
 - parameter lhs: The function on the left hand side of this operator. First function to be composed.
 - parameter rhs: The function on the right hand side of this operator. Second function to be composed.
 
 - returns: A function that transforms the first argument of the first function into the return value of the second function.
 */
public func <<< <T, U, V>(lhs: @escaping (U) -> V, rhs: @escaping (T) -> U) -> (T) -> V {
    return {
        return $0 |> rhs |> lhs
    }
}
