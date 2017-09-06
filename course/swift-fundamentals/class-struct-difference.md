# Class vs Struct
<div align="center">
<iframe width="560" height="315" src="https://www.youtube.com/embed/-R0_QLss2AE" frameborder="0" allowfullscreen></iframe>
</div>


## Introduction
Welcome to Lesson 8. There are two objectives. First, you will learn the fundamental difference between `structs` and `classes` by understanding value types and reference types. Second, you will discover why structs do not provide inheritance.

## Problem
  1. What are the differences besides inheritance?
  2. When to use `structs` over `classes`?

### Design Class
To demonstrate the difference between `classes` and `structs`, first design a class, `HumanClass` that has a `name` property.

```swift
class HumanClass {
  var name: String
  init(name: String) {
    self.name = name
  }
}
```

#### Create Instance

```swift
var humanClassObject = HumanClass(name: "Bob")
humanClassObject.name // "Bob"
```

Create another instance that "copies" `humanClassObject`

```swift
let newHumanClassObject = humanClassObject
```

Change the `name` property of `newHumanClassObject` to "Bobby".

```swift
humanClassObject.name = "Bobby"
newHumanClassObject.name // "Bobby"
```

The `name` property of `newHumanClassObject` has been changed to "Bobby" as well.


### Design Struct
Let us find out if the same behavior occurs with an object created with `structs`
```swift
struct HumanStruct {
  var name: String
  init(name: String) {
    self.name = name
  }
}
```
#### Create Instance
Create another instance that "copies" `structObject`

```swift
var structObject = HumanStruct(name: "Bob")
let newStructObject = structObject
```

Change the `name` property of `structObject` to "Bobby".

```swift
structObject.name = "Bobby"
newStructObject.name // "Bob"
```

On the contrary, the change on the `name` property of `structObject` has no effect on `newStructObject.name`.


 The graph below shows the fundamental difference between `value types` vs `reference types`.

![The difference between Value and Reference Types](/course/assets/reference-value-type-difference.png)

### Classes
For `classes`, when you create an instance that "copies", the new instance shares the object with the original instance.

```swift
let newHumanClassObject = humanClassObject // share
```

### Structs
For `structs`, when you create an instance that "copies", the new instance creates an identical copy of the object, and the object is not shared.

```swift
let newStructObject = structObject // copy-paste
```

### Mutability
Due to the fundamental difference, there is an interesting discrepancy when it comes to creating instances with `let`.

#### Mutability in Classes
Let us create an instance with `let` and attempt to mutate its property.

```swift
class BobClass {
  var name = "Bob"
}

// Create Instance
let bobClass = BobClass()
bobClass.name = "Bobby"

let newBobClass = bobClass

newBobClass.name = "Bob the Developer"
bobClass.name // "Bob the Developer"
```

Although the instance, `bobClass` has been created with `let`, the property of it has been mutated. It is possible since the instance does not own the object. Instead, it has a reference to the`BobClass` object in the cloud/RAM.

#### No Mutability in Structs

```swift
struct BobStruct {
  var name = "Bob"
}

let bobStruct = BobStruct()
bobStruct.name

bobStruct.name = "Bob Lee"
// Error: Immutable
```

With `structs`, when an instance is created with a constant, `let`, it's not possible to mutate its property since the instance has its own copy and the `let` protects anyone from interfering with its own instance.

> **Important:** Value types "store", while reference types "point".  

### When to use Struct/Value Type?
 - 10,000 - 1,000,000 faster than `classes` - [Stack Overflow]
 - No mutability due to no relationship between objects
 - Non-nested structure

[Stack Overflow]: http://stackoverflow.com/questions/24232799/why-choose-struct-over-class/24232845


### Resources
To learn more about cons of Object Oriented Programming, you may read the beginning of [Intro to Protocol Oriented Programming].

1. Intro to Protocol Oriented Programming by [Bob Lee](https://blog.bobthedeveloper.io/introduction-to-protocol-oriented-programming-in-swift-b358fe4974f)

### References
1. If you're subclassing, you are doing it wrong by [Hector Matos](https://krakendev.io/blog/subclassing-can-suck-and-heres-why)
2. All evidence points to OOP being bullshit by [John Barker](https://content.pivotal.io/blog/all-evidence-points-to-oop-being-bullshit)
3. Object Oriented Programming is exceptionally bad by [LeaseWeb labs](https://www.leaseweb.com/labs/2015/08/object-oriented-programming-is-exceptionally-bad/)
4. Why Choose Struct Over Class? on [Stack OverFlow](http://stackoverflow.com/questions/24232799/why-choose-struct-over-class/24232845)

### Source Code
> [1008-class-struct-difference.playground]

[1008-class-struct-difference.playground]:https://www.dropbox.com/sh/1gzlv0io1h4gyns/AADMutELt2Dx0gVhoADjzmcxa?dl=0


## Conclusion
You've learned the distinction between`classes` and `structs` when it comes to creating objects. Instances with `classes` have references to the object while with`structs` store. As a result, `classes` are called reference types while `structs` and `enums`, are value types.

At this point, you may find no incentive to learn the difference. You are right. For small apps, it doesn't matter. But, once you start implementing `closures` and `delegates`, and other reference related tasks,  you would soon discover a little more complexity which you will learn how to solve in Chapter 5. You will appreciate value types along with Protocol Oriented Programming soon.
