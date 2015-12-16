//
//  Mutation.swift
//  Fountain
//
//  Created by Kenneth Parker Ackerson on 12/15/15.
//  Copyright © 2015 Kenneth Ackerson. All rights reserved.
//

/// Based on https://twitter.com/jckarter/status/675445367542968320
func applied<T, U> (transform: inout T -> U -> ()) -> T -> U -> T {
    return { a in
        { b in
            var mutable = a
            transform(&mutable)(b)
            return mutable
        }
    }
}

infix operator <-> {
    associativity right
    precedence 170
}

func <-><T, U>(f: inout T -> U -> (), t: T) -> U -> T {
    return t |> (applied <| f)
}
