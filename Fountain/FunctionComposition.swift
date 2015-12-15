//
//  FunctionComposition.swift
//  Fountain
//
//  Created by Kenneth Parker Ackerson on 12/15/15.
//  Copyright © 2015 Kenneth Ackerson. All rights reserved.
//

public func >>> <A, B, C>(lhs: A -> B, rhs: B -> C) -> A -> C {
    return {
        return $0 |> lhs |> rhs
    }
}
