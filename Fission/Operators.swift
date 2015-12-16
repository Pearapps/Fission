//
//  Operators.swift
//  Fission
//
//  Created by Kenneth Parker Ackerson on 12/15/15.
//  Copyright © 2015 Kenneth Ackerson. All rights reserved.
//

infix operator <^> {
    associativity left
    precedence 130
}

infix operator <-> {
    associativity right
    precedence 170
}

infix operator <*> {
    associativity left
    precedence 130
}

infix operator -<< {
    associativity right
    precedence 110
}

infix operator >>- {
    associativity left
    precedence 110
}

infix operator |> {
    associativity left
    precedence 95
}

infix operator <| {
    associativity left
    precedence 95
}

infix operator >>> {
    associativity right
    precedence 175
}

infix operator <<< {
    associativity right
    precedence 175
}
