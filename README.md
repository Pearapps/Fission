# Fission

A collection of functions and custom operators for function composition, function application, monadic functions, and some other helpful things.

Mostly an attempt to consolidate my most used ones into one place that has all of these things, as well as provide more flexibility than similiar frameworks.

## What is included:

Operators for `flatMap` (`>>-`, `-<<`)

Operator for `map` (`<^>`)

Operators to pass a parameter into a function (`|>`, `<|`)

Functions `curry` and `uncurry`.

Function `applied` and an operator that uses it `<->`.

Function `apply` and an operator for it `<*>`. 

## Usage Examples

### `|>` and `<|` / the Function application operators

Consider a line of code like this: 

`display(lines(readFromFile("file://allwords.txt")))`

It can be pretty hard to see in what way the data is flowing or to reason about what function is called first. With the `|>` operator, we can write it like this:

`"file://allwords.txt" |> readFromFile |> lines |> display`

This makes it clear, from left to right, how your data is flowing.

`<|` is used the same way, except from right to left.

### `applied`

Since `mutating func`s do not have a return value (they return `Void`) - you must bind to a `var` like so:

```swift
var first = ["First"] 
first.appendContentsOf(["Second"])
```
      
A lot of the time, you just want to bind the mutation to a `let` variable in one statement, which is the problem `applied` solves. The example above can be written as so using Fission:

`let both = applied(Array.appendContentsOf)(["First"])(["Second"])`

Or, using the operator `<->` (and `<|`)

`let both = Array.appendContentsOf <-> ["First"] <| ["Second"]`

## Next steps:

1. Better tests (the current ones are not good)
2. A better README (documentation ?)
3. Complete header docs 
4. Carthage support

