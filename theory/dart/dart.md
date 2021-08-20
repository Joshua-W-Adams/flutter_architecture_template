# Dart

Fundamental dart concepts relevant to this repository.

## Async Generator Functions (Stream Functions)

Considering the bloc pattern effectively runs on streams of events and states. We need to have a good understanding of dart streams. The key concepts can be explained by the code snippet below.

```dart
/// async* = Async generator function
Stream<int> boatStream() async* {
    for (var i = 1; i <= 10; i++) {
        // await = awaits an async process to complete
        await Future.delayed(Duration(seconds: 2));
        // yeild = pushes the boat / event to the stream river
        yield i;
    }
}
```

## Yield

- yield : It is used to emit values from a generator either async or sync.
- yield*: It delegates the call to another generator and after that generator stops producing the values, it resumes generating its own values.