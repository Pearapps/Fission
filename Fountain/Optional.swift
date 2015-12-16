//
//  Optional.swift
//  Fountain
//
//  Created by Kenneth Parker Ackerson on 12/15/15.
//  Copyright © 2015 Kenneth Ackerson. All rights reserved.
//

public func >>- <T, U> (optional: T?, @noescape transform: T throws -> U?) rethrows -> U? {
    return try optional.flatMap(transform)
}

public func -<< <T, U> (@noescape transform: T throws -> U?, optional: T?) rethrows -> U? {
    return try optional.flatMap(transform)
}

public func <^> <T, U> (@noescape transform: T throws -> U, optional: T?) rethrows -> U? {
    return try optional.map(transform)
}

public extension Optional {
    func apply<T> (transform: (Wrapped -> T)?) -> T? {
        return transform.flatMap {
            self.map($0)
        }
    }
}

public func <*><T, U> (transforms: (T -> U)?, optional: T?) -> U? {
    return optional.apply <| transforms
}
