//
//  Curry.swift
//  Fountain
//
//  Created by Kenneth Parker Ackerson on 12/15/15.
//  Copyright © 2015 Kenneth Ackerson. All rights reserved.
//

public func curry<T, U, V>(f: (T, U) -> V) -> T -> U -> V {
    return { x in
        return {
            return f <| (x, $0)
        }
    }
}

public func uncurry<T, U, V>(f: T -> U -> V) -> (T, U) -> V {
    return {
        return f <| $0 <| $1
    }
}
