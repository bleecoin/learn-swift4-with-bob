/*:
 ## Learn Swift with Bob
 ### Intro to Functional Swift
 ### Completion Handlers
 
  **Problem:** I've heard about it. I don't know how to make one.
 
 ---
*/
//: Definition
//: > Do something when something has been done

//: Completion Handler Used?
//: 1. Notify the download has been completed
//: 2. Animation

//: Practical UIKit Example

import UIKit
let firstVC = UIViewController()
let nextVC = UIViewController()
firstVC.present(nextVC, animated: true, completion: nil)
firstVC.present(nextVC, animated: true, completion: { () in print("Done🔨") })
firstVC.present(nextVC, animated: true, completion: { print("Done🔨") } )


//: Design Handler Block
let myHandlerBlock: (Bool) -> () = { (isSuccess: Bool) in
  if isSuccess {
    print("Download has been finihsed")
  }
}

let handlerBlock: (Bool) -> () = {
  if $0 {
    print("Download Completed")
  }
}

myHandlerBlock(true)



//: Design Function
func downloanAnImage(completionBlock: (Bool) -> Void) {
  for _ in 1...100 {
    print("Downloading")
  }
  
  completionBlock(true) // myHadlerBlock(true)
}

//: Pass Closure Indirectly
downloanAnImage(completionBlock: myHandlerBlock)

//: Pass Closure Directly
downloanAnImage { (isSuccess: Bool) in
  if isSuccess {
    print("Done")
  }
}


//: Another Example
let handler: ([String]) -> Void = { (array) in
  print("Done working, \(array)")
}

handler(["Blog", "Course", "Editing"])

func workSuperHard(doneStuffBlock: ([String]) -> Void) {
  for _ in 1...100 {
    print("But you gotta put in 🔨, 🔨, 🔨")
  }
  doneStuffBlock(["Blog", "Course", "Editing", "Helping"])
}
workSuperHard(doneStuffBlock: handler)

workSuperHard { (workList: [String]) in
  print("I've done \(workList[0]). Let me go 🕶")
}
// “But you gotta put in 🔨, 🔨, 🔨”
// “But you gotta put in 🔨, 🔨, 🔨”
// "I've done Blog. Let me go 🕶"












