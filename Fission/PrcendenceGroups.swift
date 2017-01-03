//
//  PrcendenceGroups.swift
//  Fission
//
//  Created by Kenneth Parker Ackerson on 11/26/16.
//  Copyright © 2016 Kenneth Ackerson. All rights reserved.
//

precedencegroup ApplicationRight {
    associativity: left
    higherThan: AssignmentPrecedence
}

precedencegroup ApplicationLeft {
    associativity: left
    higherThan: AssignmentPrecedence
}

precedencegroup LeftDefaultMonadicFunctions {
    associativity: left
    higherThan: AssignmentPrecedence
    lowerThan: LogicalDisjunctionPrecedence
}

precedencegroup RightDefaultMonadicFunctions {
    associativity: left
    higherThan: AssignmentPrecedence
    lowerThan: LogicalDisjunctionPrecedence
}
