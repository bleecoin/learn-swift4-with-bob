# Prerequisites
This course is designed for the Swift intermediates. So, I won't cover the basics. Please visit the lecture notes and go to prerequisites. You will find a list of items you are expected to know. There is a free tutorial under each topic. In a nutshell, you should be already be familiar with `switch`, `else-if`, basic `enums`, `function`, and what it means to initialize properties.

## Variables and Constants
```swift
let imuttableName = "Bob"
var muttableName = "Bobby"

imuttableName = "SangJoon" // Error
```

>[Variable vs Constants](https://www.youtube.com/watch?v=W8l-Kt_aKNo&list=PL8btZwalbjYlRZh8Q1VK80Ly0YsZ7PZxx&index=1)

## Conditional Statement
```swift
if isBobHansome {
  print("He good")
} else {
  print("That's okay")
}
```

> [Conditional Statement](https://www.youtube.com/watch?v=ayuB4HChkI0&index=2&list=PL8btZwalbjYlRZh8Q1VK80Ly0YsZ7PZxx)

## Array and Dictionary
```swift
let countries = ["S.Korea", "USA", "Vietnam", "Malaysia"]
let info = ["Name": "Bob", "Age": "20"]
```

> [Array and Dictionary](https://www.youtube.com/watch?v=yfFkj_8c70o&index=3&list=PL8btZwalbjYlRZh8Q1VK80Ly0YsZ7PZxx)

## For-In Loops
```swift
for _ in 1...100 {
  print("Repeat")
}

// "Repeat"
// "Repeat"
// ...
```

> [For-In Loop](https://www.youtube.com/watch?v=bPrdNIEoZio&list=PL8btZwalbjYlRZh8Q1VK80Ly0YsZ7PZxx&index=4)

## Switch Statement
```swift
switch number {
case 1...10 :
  print("Your number is between 1 to 10")
default:
  print("I don't know")
}
```

> [Switch Statement](https://www.youtube.com/watch?v=Q-X3Xbr6LP8&index=5&list=PL8btZwalbjYlRZh8Q1VK80Ly0YsZ7PZxx)

## Function
```swift
func returnName() -> String {
  return "Bob the Developer"
}
```

> [Function](https://www.youtube.com/watch?v=mvteZcbFRbA&list=PL8btZwalbjYlRZh8Q1VK80Ly0YsZ7PZxx&index=6)


## Intro to Enums
```swift
enum Race: String {
  case asian
  case white
  case black
  case hispanic
}

Race.asian.rawValue // "asian"
```

> [Basic Enum](https://www.youtube.com/watch?v=DHCgaQ5GeR4&list=PL8btZwalbjYlRZh8Q1VK80Ly0YsZ7PZxx&index=8)


## Object Oriented Programming
You should be familiar with initialization, property, method, and inheritance

```swift
 class Human {
   let name: String

   init(enterName: String) {
     name = enterName
   }

   func sayName() {
     print("Hi, I'm \(name)")
   }
 }
```

 - [What is Object Oriented Programming](https://www.youtube.com/watch?v=orvmHi498YI&index=9&list=PL8btZwalbjYlRZh8Q1VK80Ly0YsZ7PZxx)
 - [Inheritance](https://www.youtube.com/watch?v=YtA1b7dX_ZE&list=PL8btZwalbjYlRZh8Q1VK80Ly0YsZ7PZxx&index=10)
 - [Initialization](https://www.youtube.com/watch?v=Jejtrj9Xfpk&index=11&list=PL8btZwalbjYlRZh8Q1VK80Ly0YsZ7PZxx)
