# Model View Controller (MVC)

TODO - Thorough review of MVC architectural pattern required and this file updated to suit.

```
Separating your application into 3 distinct layers, model, view and controller.
```

## Model

```
Responsibile for all data and logic. Should be independant from all other layers.
```

## Controller

```
Responsible for co-oridinating all events and returning responses. This can be events on a server (e.g. request) or events from a user interface.
```

## View

```
Responsible for evertyhing associated to the user interface.
```

## Implementation

A very basic file structure as follows is the proposed implemention of this architectural pattern.

```
/src
    /view
        /feature 1
    /domain
        /feature 1
            controller.dart
            model.dart
            repository_interface.dart
    /data
        /feature 1
            repository_implementation.dart
            data_source.dart
```