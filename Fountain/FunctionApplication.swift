//
//  FunctionApplication.swift
//  Fountain
//
//  Created by Kenneth Parker Ackerson on 12/15/15.
//  Copyright © 2015 Kenneth Ackerson. All rights reserved.
//

public func |> <T, U> (lhs: T, @noescape transform: T -> U) -> U {
    return transform(lhs)
}
