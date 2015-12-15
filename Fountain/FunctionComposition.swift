//
//  FunctionComposition.swift
//  Fountain
//
//  Created by Kenneth Parker Ackerson on 12/15/15.
//  Copyright © 2015 Kenneth Ackerson. All rights reserved.
//

public func >>> <T, U, V>(lhs: T -> U, rhs: U -> V) -> T -> V {
    return {
        return $0 |> lhs |> rhs
    }
}

public func <<< <T, U, V>(lhs: U -> V, rhs: T -> U) -> T -> V {
    return {
        return $0 |> rhs |> lhs
    }
}
