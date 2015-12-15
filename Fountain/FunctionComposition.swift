//
//  FunctionComposition.swift
//  Fountain
//
//  Created by Kenneth Parker Ackerson on 12/15/15.
//  Copyright © 2015 Kenneth Ackerson. All rights reserved.
//

func >>> <A, B, C>(lhs: B -> C, rhs: A -> B) -> A -> C {
    return {
        lhs(rhs($0))
    }
}



