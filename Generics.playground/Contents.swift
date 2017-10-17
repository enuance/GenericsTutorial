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
