# Avoid these c++ behaviors:
1. don't define namespaces at top for everything
2. print newline rather than flush buffer using endline
3. use range based loops
4. using a loop when an algo already does it
5. using a standard array over c-style array
    - decay into pointers
    - require length of array
6. avoid reinterpret cast
    - use bitcast
7. avoid casting away const
    - use at method that throws when word is not in map
8. operator square brakets can insert element into map if it does not exist w/ count 0
9. if vector is not modified inside function, add const at top
10. string literals = gauranteed to live for lifetime of program
    ```c++
    const char *string_literal_lifetimes() { return "string literals"}
    ```
11. use structured bindings
    for (const auto &pair: colors) == bad
    for (const auto&[name, hex]: colors) == good
    - can be used with your own types if names are public
12. avoid multiple out parameters
    - use a struct
    - return multiple values as single struct
    - caller can use structural  bindings to separate results
13. avoid work at runtime that can be done at compile time
    - use constexpr
14. remember to mark virtual fns
    - if derived class called through pointer, only derived class destructor is called not base class destructor
    - mark derived class destructor as override
15. Understand order of initialization = order of declaration 
    ```c++
    class View{
        public:
            view(char *start, size_t: size): m_start{start}, m_end{m_start + size} {} // m_end is secend but declared first = wrong
        private:
            char *m_end; // m_end declared first, wrong
            char *m_start;
    }
    ```
16. Default vs Value Initialization 
```c++
int x; // default
int *x2 = new int; // default
int y{}; // value = 0
int *y2 = new int{}; // value = 0
int *y3 = new int(); // value = 0
int z(); // neither default nor value b/c fn decl
```
17. Avoid overusing magic numbers
- instead of c = 3e10^8 use speed of light
18. Do not add or remove elements while looping over it
    - use looping over iterators here
19. do not return std::move()
- obfuscates return value optimization from compiler
- move = cast to rvalue
20. does not code left to right (usually does but not always)
- order fn arguments are evaluated in is not gauranteed left to right
- does not matter for pure fns
21. Avoid heap allocs when stack allocs are fine
- for small objects, stack allocs are fine
23. use unique pointer + shared pointer to do heap allocations
- prevents loss during exceptions
    - unique = holds memory in destructor gauranteeing its destruction when going out of scope
    - shared = has reference counter = when out of scope = deletes itself
24. use make:unique or make:shared 
    - don't make them yourself, pass to fn which then calls constructor of your object to make them
25. avoid using new or delete at all costs
- unique ptr already does new/delete
26. manual resource management
    - have a class use its destructors to clean it up for you
    - RAII = resource acquisition is initialization (resources released upon destruction)
27. raw pointers are not bad
- if fn has no ownership of objects, then no need for smart pointers
- raw pointers don't own what they point too
- c does not share this convention - will return data that you need to free
    - can still use unique pointers but need to define your own deleter
28. do not return shared pointer when you are not sure object will be shared = use a unique pointer
    - convert shared to unique = harder than just giving a unique pointer
29. shared pointer is not perfectly thread safe
    - reference counting = thread safe
    - access of resource is not atomic + no locks = not thread safe
30. const pointer vs pointer to const 
- const applies to what is to its left unless its leftmost thing then it applies to its right
```c++
int x = 0;
int y = 0;
const int *ptr1 = &x; // const applies to int = cannot change value
int const *ptr2 = &x; // const applies to int = cannot change value
int *const ptr3 = &x; // const applies to ptr = can change value but not memory location
```
31. Never ignore compiler warnings
