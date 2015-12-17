# Fission

A collection of functions and custom operators for function composition, function application, the monadic functions, and some other helpful things.

Mostly an attempt to consolidate my most used ones into one place that has all of these things, as well as provide more flexibility than similiar frameworks.

## What is included:

Operators for `flatMap` (`>>-`, `-<<`)

Operator for `map` (`<^>`)

Operators to apply a function to a parameter (`|>`, `<|`)

Functions `curry` and `uncurry`.

Function `compact`.

Function `applied` and an operator that uses it `<->`.

Function `apply` and an operator for it `<*>`. 

## Usage Examples

### `|>` and `<|` - the function application operators

Consider a line of code like this: 

`display(lines(readFromFile("file://allwords.txt")))`

It can be pretty hard to see in what way the data is flowing or to reason about what function is called first. With the `|>` operator, we can write it like this:

`"file://allwords.txt" |> readFromFile |> lines |> display`

This makes it clear, from left to right, how your data is flowing.

`<|` can be used the same way, except from right to left.

### `compact`

Let's say you have a collection (lets say `Array` for now) that contains optionals (so they type signature is something like `Array<String?>` - `compact` is a function that can convert that array into something of type `Array<String>` as such:

`let array = ["Swift", Optional<String>.None, "Kenny"]` which is of type `Array<String?>` - you can easily remove the optionals like so with Fission's `compact` function; `compact(array)`.

### `curry`

`curry` transforms a function that takes two arguments into a function that returns another function - both of which take one argument.

This can be useful if you want to partially apply a function that is not already curried. Take for example this function:

`func add(first: Double, second: Double) -> Double { return first + second }`

If you wanted to partially apply this for any reason (maybe you want to pass a function of type `Double -> Double` into a higher order function) you can use the `curry` function as so:

`let curriedAddition = curry(add)(4.0)`

and you called the function with 3.0 `curriedAddition(3.0)` - the result will be `7.0`

`uncurry` works in the opposite way, so if you did `uncurry(curry(add))` - you end up with a function with the same signature as the original `add` function.

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

