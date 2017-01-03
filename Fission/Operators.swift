//
//  Operators.swift
//  Fission
//
//  Created by Kenneth Parker Ackerson on 12/15/15.
//  Copyright © 2015 Kenneth Ackerson. All rights reserved.
//

infix operator <^> : LeftDefaultMonadicFunctions

infix operator <-> : RightDefaultMonadicFunctions

infix operator <*> : LeftDefaultMonadicFunctions

infix operator -<< : RightDefaultMonadicFunctions

infix operator >>- : LeftDefaultMonadicFunctions

infix operator |> : ApplicationLeft

infix operator <| : ApplicationRight

infix operator >>> : RightDefaultMonadicFunctions

infix operator <<< : RightDefaultMonadicFunctions
