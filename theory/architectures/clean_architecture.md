# CLEAN Architecture

CLEAN architecture is an applications architecture proposed by Robert C. Martin in the official [CLEAN architecture blog](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) with the main objective being:
```
"the separation of concerns by dividing the software into layers"
```

It is clearly shown in the diagram below:

![Clean Architecture](./../img/clean_architecture.jpg)

Note:
- The arrows between each layer indicate the follow of dependancies.

The core rule of this architecture is the *Dependacy Rule*:
```
"source code dependencies can only point inwards. Nothing in an inner circle can know anything at all about something in an outer circle."
```

High level definitions for each aspect of the diagram are as follows:

## Entities

An entity can be an object with methods, or it can be a set of data structures and functions. It doesn’t matter **so long as the entities could be used by many different applications**. 

For example an entity may be a basic data class as follows:

```dart
class RectangleEntity {
    final num base;
    final num height;

    RectangleEntity({
        required this.base, 
        required this.height,
    });

    num area() {
        return this.base*this.height;
    }
}
```

## Use Cases 

A use case is 
```
"a specific situation in which a product or service could potentially be used."
```
Specifically in the context of CLEAN architecture they are the **Application specific business rules**. i.e. the Application specific entities.

An example of a use case is as follows: 

```dart
class ExerciseEntity {
    
    final String name;
    final String videoUrl;
        
    ExerciseEntity({
        required this.name, 
        required this.videoUrl,
    });
}

class PlayExerciseUseCase {

    final ExerciseEntity exercise;
    final UrlPlayerInterface urlPlayer;

    PlayExerciseUseCase({
        required this.exercise, 
        required this.urlPlayer,
    });

    void playExercise() {
        urlPlayer.play(this.exercise.videoUrl);
    }
}
```

## Adapters

The adapter layer is responsible for converting data formats from the outside world (databases, web apis, device gps systems etc.) to the format required by the inside world (domain layer... use cases and entities).

Uncle bob states it as:

```
"Convert data from the format most convenient for the use cases and entities, to the format most convenient for some external agency such as the Database or the Web."
```

I like to think of adapters as opering like a power adapter. Converting the power interface from the format used by country A to that of country B.

Adapters are separated into 3 types as follows:

### Presenters

Responsible for converting **output** from the domain layer to the format required by the user interface for display.

### Controllers

Responsible for converting the data provided by the user interface to the **input** format required by the domain layer.

### Gateways

Responsible converting the data provided by the data source (e.g. Postgresql, Mysql, REST API etc.) to the format required by the domain layer, and visa versa.

### Frameworks and Drivers

The outer most layer of the application. I like to think of it as the presentation and data layers.

This layer contains all the things that are most likely to change in your application. For example the database technology used, user interface, web apis etc.