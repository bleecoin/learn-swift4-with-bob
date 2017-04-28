# Swift Memory Management
You've successfully completed Chapter 5, Swift Memory Management. In Lesson 1, class objects are automatically deallocated by the number of references. However, there are cases when objects are never deallocated. The situation is called retain cycle or memory leak. To solve this, you may use either `weak` or `unowned` reference to not increase the reference count of an object. In Lesson 2 and 3, you've learned how to create retain cycles in the delegate pattern and closures. Be aware when you use reference types over value types. In Lesson 4, you've learned how to distinguish between `@escaping` and `@nonescape` closures. A function requires closure in its parameter with the `@escaping` keyword only if it is executed at any point after the function returns. Swift functions are `@nonescape` by default. The closure is initialized, yet deallocated after the function returns.

In the following chapter, you will learn how to combine the best of the best to design a scalable and fantastic codebase, a.k.a, generic protocols. 