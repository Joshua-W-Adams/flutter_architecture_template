# Inversion of Control (IoC)

Inversion of Control is a software design principal that is
```
the principle of separating configuration from use.
```

It is effectively a solution to:
```
how can I get instances concrete implementations of dependancies into class interfaces?
```

By using what is called an IoC Container. Which is basically a class when constructs instances of other classes. i.e. a Factory.

There are multiple design patterns to implement these IoC containers and the IoC principal as follows:
- dependancy injection pattern
- service locator pattern
- factory pattern

For more information i highly recommend [Martin Fowlers Article](https://martinfowler.com/articles/injection.html).

## Background 

### Dependancy

When Class A required Class B to work. Class B is considered a dependacy.

### Dependancy Injection

Is when dependancies are added to classes from OUTSIDE the class. 

For example when passed through a constructor.
```dart
class ClassA {
    final ClassB;
    // ClassB is injected into Class A
    const ClassA({required this.ClassB})
}
```
The whole point is to decouple **construction of classes from construction of dependancies**. To make out code more CLEAN.

### Dependancy Inversion Principal (DIP)

The DIP principal is from SOLID design principals from Uncle Bob. This principal states:
```
High level modules should not depend on low level modules. Both should depend on abstractions. Abstractions should not depend on details.
```
But what this means in practice is that you should use interfaces and factorys to construct classes in your code.

### Inversion of Control (IoC) Containers

When you have a interface and an implementation you need some way to get the implementation into the interface. This is what an IoC Container does.

```
Meaning you dont construct classes directly. You ask the IoC container to create you a class instance with all its dependancies injected.
```

## Notes

### Singletons

```
singleton pattern is a software design pattern that restricts the instantiation of a class to one "single" instance.
```