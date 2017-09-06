# Optionals
<div align="center">
<iframe width="560" height="315" src="https://www.youtube.com/embed/goS_u0cbd8M" frameborder="0" allowfullscreen></iframe>
</div>

## Introduction
Welcome to the first lesson of The Swift Fundamentals. When I first started programming in Swift, I took courses from Udemy, Treehouse, Lynda, and many more. Yet, I could not understand what those `?`s and `!`s stood for.  Xcode kept telling me what to do on the left side, causing more problems. It seemed like no instructor could explain the reasoning behind how to use `optionals`, and most importantly, why the Swift engineers have implemented such a feature that is unique compared to other programming languages. Today, You will discover the rationale behind with me.

## Problem
Why did the Swift engineers implement `optionals`?

### Swift Rules
 1. Every variable type must be defined (Implicit/Explicit)
 2. The type is inferred based on the value

```swift
// String
let name: String = "Bob"          // Explicit
let newName = "Bob the Developer" // Implicit

// Numbers
let myAge: Int = 20               // Explicit
let mySisterAge = 14              // Implicit
let myGPA: Double = 3.54          // Explicit
```

### Fetching Profile Picture
When you fetch a profile picture from Facebook, it may return no value, a.k.a`nil`. However, you may not store `nil` to a normal type based on the rule above.

```swift
// Successful
let myProfileImageURL: String = "https//facebook.com/bobthedeveloper"
// Error
let myProfilePictureURL: String = nil
```

### Introduction to Optionals
Optionals allow storing `nil`, a.k.a absence of value.

```swift
let myName: String? = nil
let yourName: String? = "Bob Lee"

print(myName) // nil   
print(yourName) // Optional("Bob Lee")

let bobAge: Int? = nil
let robAge: Int? = 123
let danAge: Int? = 3
```

### Optionals Rules
1. Optionals/Normal Types do not interact with each other
2. Convert Optionals to Normal Types for usage. The process is also known as `unwrapping`.

```swift
robAge + danAge
// Error
```

### Optionals Unwrapping
There are two ways to convert/unwrap optional types to normal types

1. Forced unwrapping
2. Implicit unwrapping

#### Forced Unwrapping
 You may convert by inserting `!` at the end of  the variable. Forced Unwrapping should be avoided since it causes a crash if the optional type contains `nil` since a normal type can't store `nil`.

```swift
let newRobAge = robAge!
print(newRobAge) // normal type
let newDanAge = danAge!
print(newRobAge) // normal type
```

#### Problem
```swift
var image: String? = nil
```
Now, let us force unwrap `image`.

```swift
var image! // Error
```

It does not work because you are not allow to store `nil` to a normal type. Again, unwrapping refers to the process of converting from an optional type to a normal type.


> You can't store `nil` to a normal type in Swift. It violates the Swift rule.

#### Implicit Unwrapping
Implicit unwrapping is a safe way to convert. If the optional type contains `nil`, it does not break the system. Instead, it ignores. Implicit unwrapping is an added feature to an `else-if` statement.

```swift
let imageFromFaceBook: String? = "Bob's Face"

if let normalImage = imageFromFaceBook {
  print(normalImage) // normalImage is a constant
} else {
  print("There is no image")
}
```
Now `normalImage` contains a normal type of `String`. You may use the `normalImage` constant within the `if` block. On the contrary, if `imageFromFaceBook` contains `nil`, Swift executes the `else` block instead.

### Source Code
> [optionals.playground](https://www.dropbox.com/sh/ry4xk8sg08x8ewy/AACQpd9LEzk-9qjYvaK1d8_da?dl=0)

### Resources
<iframe src="https://docs.google.com/presentation/d/1DDhLcBX6kBheVXlQNxMCrJp_OP0mXC82NgJHCPnW-OY/embed?start=false&loop=false&delayms=3000" frameborder="0" width="100%" height="460" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>

## Conclusion
You've learned two fundamental concepts in the Swift Programming Language. The rule number one states, every type, even if `optionals`, has to be defined explicitly or implicitly. Second, there are two ways to unwrap `optionals` to normal types.  You may force unwrap with `!` or safety unwrap with `if-let`.

In the next lesson, you will learn why `?` and `!` automatically appear when you create an object and access its properties and methods.
