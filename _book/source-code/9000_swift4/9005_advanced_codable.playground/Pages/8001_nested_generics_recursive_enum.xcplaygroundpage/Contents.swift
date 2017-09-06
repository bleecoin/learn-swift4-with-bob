/*:
 ## Learn Swift with Bob
 ### What's New in Swift 4
 ### 9005_Advanced Codable
 
 **Problem:** JSON file and Blueprint look different
 
 ---
 
 */

let geek = """
{
 "stackOverFlowId": "bobthedev",
 "name": "Bob",
 "platform": "iOS"
}
""".data(using: .utf8)! // our native (JSON) data


//: Customize Coding Keys
struct Geek: Codable {
  var username: String
  var name: String
  var platform: String
  
  enum CodingKeys: String, CodingKey {
    case username = "stackOverFlowId"
    case name
    case platform
  }
  
}

import Foundation

let geekObject = Geek(username: "bobthedev", name: "Bob Lee", platform: "iOS")
let encoder = JSONEncoder()

//: Encode Object to JSON
do {
  let data = try encoder.encode(geekObject)
  print(String(data: data, encoding: .utf8)!)
} catch (let error) {
  print(error)
}


//: Fully Customize by conforming to `Encodable`
struct Blog {
  let author: String
  let id: Int
  let url: URL
  
  enum BlogCodingKeys: String, CodingKey { // declaring our keys
    case author
    case id
    case url
  }
}


extension Blog: Encodable {
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: BlogCodingKeys.self)
    try container.encode(author, forKey: .author)
    try container.encode(id, forKey: .id)
    try container.encode(url, forKey: .url)
  }
}

//: Create Object
let post = Blog(author: "Bob", id: 1, url: URL(string: "https://www.bobthedeveloper.io")!)

//: Encode (Object to JSON)
do {
  let myBlog = try JSONEncoder().encode(post)
  let string = String(data: myBlog, encoding: .utf8)
  print(string)
} catch(let error) {
  print(error)
}

//: Customizing Decode
struct User {
  let name: String
  let citizenship: String
  let id: Int
  
  init(name: String, citizenship: String, id: Int) {
    self.name = name
    self.citizenship = citizenship
    self.id = id
  }
}


extension User: Decodable {
  enum UserCodingKeys: String, CodingKey {
    case name
    case id
    case citizenship
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: UserCodingKeys.self)
    let name: String = try container.decode(String.self, forKey: .name)
    let citizenship: String = try container.decode(String.self, forKey: .citizenship)
    let id: Int = try container.decode(Int.self, forKey: .id)
    self.init(name: name, citizenship: citizenship, id: id)
  }
}

let userBobData = """
{
 "name": "Bob Lee",
 "id": 1,
 "citienship": "Republic of Korea"
}
""".data(using: .utf8)!
let userBob = try JSONDecoder().decode(User.self, from: userBobData)
print(userBob)

