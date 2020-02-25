/*:
 [Previous](@previous)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Next](@next)
 
 # Observer
 - - - - - - - - - -
 ![Observer Diagram](Observer_Diagram.png)
 
 The observer pattern lets one object observe changes on another object. It involves three types:
 
 (1) The **subscriber** is the "observer" object and receives updates.
 
 (2) The **publisher** is the "observable" object and sends updates.
 
 (3) The **value** is the underlying object that's changed.
 
 ## Code Example
 */
import Combine

public class User {
    @Published var name: String
    public init(name: String) {
        self.name = name
    }
}

let user = User(name: "Ray")
// create the object that can be listened to
let publisher = user.$name
// create the subscriber with sink
var subscriber: AnyCancellable? = publisher.sink() {
    print("User's name is \($0)")
}
// change the value
user.name = "Vicki"

// stop subscribing
subscriber = nil

// doesn't get pushed out
user.name = "Ray has left the building"
