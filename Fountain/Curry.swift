//
//  Curry.swift
//  Fountain
//
//  Created by Kenneth Parker Ackerson on 12/15/15.
//  Copyright © 2015 Kenneth Ackerson. All rights reserved.
//

func curry<A, B, C>(f: (A, B) -> C) -> A -> B -> C {
    return { a in
        return { b in
            return f(a, b)
        }
    }
}

func uncurry<A, B, C>(f: A -> B -> C) -> (A, B) -> C {
    return { a, b in
        return f(a)(b)
    }
}
