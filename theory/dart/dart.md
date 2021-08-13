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