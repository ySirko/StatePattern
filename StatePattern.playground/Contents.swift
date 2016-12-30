/*:
 # State Pattern
 
 The state pattern is a behavioral software design pattern that implements a state machine in an object-oriented way.
 */


protocol State {
    
    var description: String { get }
    
    func push(button: ButtonContext)
}

class On: State {
    
    var description: String {
        return "On state"
    }
    
    func push(button: ButtonContext) {
        button.state = Off()
    }
}

class Off: State {
    
    var description: String {
        return "Off state"
    }
    
    func push(button: ButtonContext) {
        button.state = On()
    }
}

final class ButtonContext {
    
    var state: State = Off()
    
    func push() {
        state.push(button: self)
    }
}


let button = ButtonContext()
print("\(button.state.description)")

button.push()
print("\(button.state.description)")
button.push()
print("\(button.state.description)")
button.push()
print("\(button.state.description)")

