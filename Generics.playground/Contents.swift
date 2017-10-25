/*
 
 Clone this playground by entering this in the command line:
 git clone https://github.com/enuance/GenericsTutorial.git
 
 What are Generics?
 
 Definition From The Apple Dev Docs Page: Generic code enables you to write flexible, reusable functions and types that can work with any type, subject to requirements that you define. You can write code that avoids duplication and expresses its intent in a clear, abstracted manner.
 
 Generics are one of the most powerful features of Swift, and much of the Swift standard library is built with generic code. In fact, you’ve been using generics throughout the Language Guide, even if you didn’t realize it. For example, Swift’s Array and Dictionary types are both generic collections. You can create an array that holds Int values, or an array that holds String values, or indeed an array for any other type that can be created in Swift. Similarly, you can create a dictionary to store values of any specified type, and there are no limitations on what that type can be.
 
 My definition: Generics are a kind of placeholder that allows us to instruct the compiler to hold off on determining the type of object being defined until it is actually called.
 
 Syntax: ObjectName<TypePlaceholder:PlaceholderContstraints>(){}
 
 */

import Foundation

fileprivate class StackElement<T>{
    var value: T
    var nextStackElement: StackElement?
    init(value: T){self.value = value}
}

class Stack<Element>{
    private var top: StackElement<Element>?
    var showing: Element?{return top?.value}
    var underneath: Element?{return top?.nextStackElement?.value}
    var root: Element?{return findRoot()}
    var count: Int{return findCount()}
    
    func push(value: Element){
        let newTop = StackElement(value: value)
        newTop.nextStackElement = top
        top = newTop
    }
    
    func pop() -> Element?{
        guard let currentTop = top else{return nil}
        let oldTop = currentTop
        top = oldTop.nextStackElement
        return oldTop.value
    }
    
    private func findCount(stackElement: StackElement<Element>? = nil, isStarting: Bool = true, currentCount: Int = 0) -> Int{
        if isStarting{ return findCount(stackElement: top, isStarting: false)}
        if let stackElement = stackElement{
            let newCount = currentCount + 1
            return findCount(stackElement: stackElement.nextStackElement , isStarting:false, currentCount: newCount)
        }
        return currentCount
    }
    
    private func findRoot(stackElement: StackElement<Element>? = nil, isStarting: Bool = true) -> Element?{
        if isStarting{return findRoot(stackElement: top,isStarting: false)}
        if let nextStackElement = stackElement?.nextStackElement{
            return findRoot(stackElement:nextStackElement, isStarting: false)
        }
        return stackElement?.value
    }
    
}

let testStack = Stack<Int>()
testStack.push(value: 12)
testStack.push(value: 22)
testStack.pop()
testStack.pop()
testStack.pop()
testStack.root
testStack.count

class Bob: Equatable{
    static func ==(lhs: Bob, rhs: Bob) -> Bool {
        return lhs.age == rhs.age
    }
    
    var age: Int
    init(age: Int){
        self.age = age
    }
    
}

var firstValue = Bob(age:1)
var secondValue = Bob(age:2)

func swapTwoValue<T: Equatable>(one: inout T, two: inout T){
    let holder = one
    one = two
    two = holder
}

swapTwoValue(one: &firstValue, two: &secondValue)



