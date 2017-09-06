/*:
 ## Learn Swift with Bob
 ### What's New in Swift 4
 ### 9004_Intro to Codable
 
 **Problem:** Map JSON to Object in one line of code and vice versa
 
 ---
 
 */

//: Your Past
enum SerializationError: Error {
  case missing(String)
  case invalid(String, Any)
}

struct Post {
  let title: String
  let subtitle: String
  let markdown: String
  let author: String
  let tags: [String]
  
  public init(json: [String: Any]) throws {
    guard let title = json["title"] as? String else {
      throw SerializationError.missing("title")
    }
    
    guard let subtitle = json["subtitle"] as? String else {
      throw SerializationError.missing("subtitle")
    }
    guard let markdown = json["markdown"] as? String else {
      throw SerializationError.missing("markdown")
    }
    
    guard let author = json["author"] as? String else {
      throw SerializationError.missing("author")
    }
    
    guard let tags = json["tags"] as? [String] else {
      throw SerializationError.missing("tags")
    }
    
    self.title = title
    self.subtitle = subtitle
    self.markdown = markdown
    self.author = author
    self.tags = tags
  }
}


//: Import Foundation
import Foundation

//: Design Model
struct User: Codable {
  var name : String
  var loginMethods : [LoginMethods]
  var numberOfFriends : Int
  
  enum LoginMethods: String, Codable {
    case facebook, instagram, linkedin, twitter
  }
}

//: Create Object
let bob = User(name: "Up", loginMethods: [.facebook, .instagram], numberOfFriends : 4)

//: ### Encode (Object to JSON)
//: Create Encoder
let jsonEncoder = JSONEncoder()

//: Modify Setting/Property
jsonEncoder.outputFormatting = .prettyPrinted

//: Encode
var data: Data?

do {
  let jsonData = try jsonEncoder.encode(bob)
  data = jsonData
  let jsonString = String(data: jsonData, encoding: .utf8)
  print("JSON String : " + jsonString!)
} catch(let error) {
  print(error)
}

//: ### Decode (JSON to Object)
//: Create Decoder
let jsonDecoder = JSONDecoder()
//: Decode
do {
  let bob = try jsonDecoder.decode(User.self, from: data!)
  // let bob = try jsonDecoder.decode(AnotherUser.self, from: data!)
  print("Name : \(bob.name)")
  print("Number of friends: \(bob.numberOfFriends)")
} catch(let error) {
  print(error)
}

//: Meaning of `self`
let userType = User.self
userType.init(name: "Bob", loginMethods: [.facebook], numberOfFriends: 1)

//: > It has to look identical --> Less flexible


//: Another Example
struct Geek: Codable {
  let stackOverFlowId: String
  let name: String
  let platform: String
}

let geek = """
{
 "stackOverFlowId": "bobthedev",
 "name": "bob",
 "platform": "iOS"
}
""".data(using: .utf8)! // our data in native (JSON) format


do {
  let geekBob = try JSONDecoder().decode(Geek.self, from: geek) // Decoding our data
  print(geekBob)
} catch(let error) {
  print(error)
}



//: ### Working with Array Type JSON
//: Create JSON in Array
let geeks = """
[{
 "stackOverFlowId": "bobthedev",
 "name": "Bob",
 "platform": "iOS"
},{
 "stackOverFlowId": "robthedev",
 "name": "Rob",
 "platform": "Android"
},{
 "stackOverFlowId": "nobthedev",
 "name": "Nob",
 "platform": "Backend"
}]
""".data(using: .utf8)! // our data in native format

//: Data to Object (Encode)
do {
  let developers = try JSONDecoder().decode([Geek].self, from: geeks)
  developers.forEach { print($0) }
} catch (let error) {
  print(error)
}


//: Create JSON in Diciontary
let geeksDict = """
{
  "1": {
     "stackOverFlowId": "bobthedev",
     "name": "Bob",
     "platform": "iOS"
  },
  "2": {
     "stackOverFlowId": "robthedev",
     "name": "Rob",
     "platform": "Android"
  },
  "3": {
     "stackOverFlowId": "nobthedev",
     "name": "Nob",
     "platform": "Backend"
  }
}
""".data(using: .utf8)! // our data in native format

//: Data to Object (Encode)
do {
  let geekDictionary = try JSONDecoder().decode([String: Geek].self, from: geeksDict)
  geekDictionary.forEach { print("\($0.key): \($0.value)") }
} catch(let error) {
  print(error)
}






