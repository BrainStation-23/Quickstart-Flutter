# Flutter Boilerplate Template by Brain Station 23 Ltd

This repository provides a comprehensive boilerplate template for building Flutter applications with
all the essential features pre-configured. Whether you are a beginner or an experienced Flutter
developer, this template aims to kickstart your project with a solid foundation, following best
practices and industry standards.

## Features Included

1. **State Management using Flutter Bloc:**
   Flutter Bloc is a robust state management library that helps you manage the flow of data in your
   application. This boilerplate template utilizes the Bloc pattern, which separates the UI from the
   business logic, resulting in more organized and testable code. With Flutter Bloc, you can handle
   complex state changes, such as loading, success, and error states, efficiently. The template
   provides examples of how to create and use Blocs, making it easier for you to handle application
   state seamlessly. But the boilerplate itself does not force developers to use bloc. There are opportunities
   to use any kind of state management.

2. **Localization Support using json Files:**
   Providing a localized experience to your app users is crucial for a global audience. This
   boilerplate template provides localization support using json files using slang. The json files allow you to
   store translations in key-value pairs for different locales. With the provided json files, you can
   easily add, update, or remove translations for various languages, enabling a personalized user
   experience. Our boilerplate provides abstraction for localization. So if someone does not want to use slang for localization, there are opportunities to implement a different localization and use it in the app. The main app will not know the difference.

3. **Network Calls with Dio:**
   Networking is an integral part of modern applications, and Dio is a powerful HTTP client for
   making network calls. The boilerplate template integrates Dio, allowing you to interact with
   RESTful APIs efficiently. It demonstrates best practices for handling network requests, such as
   error handling, request cancellation, and API client creation. With Dio, you can build robust and
   reliable apps that communicate with backend services seamlessly. Our boilerplate provides abstraction so that if someone does not want to use `dio`, they can implement their own network calls by implementing the abstraction.

4. **Local Storage with Shared Preferences:**
   Local storage is essential for saving small amounts of data locally in the app. The boilerplate
   template uses the Shared Preferences plugin to handle local storage operations efficiently. You
   can store user preferences, settings, or cached data locally, improving app performance and user
   experience. In the boilerplate, abstraction provided to implement any other kind of mechanism for storing data locally.

5. **Dependency Injection using GetIt:**
   Managing dependencies is essential for writing clean, testable, and maintainable code. This
   template incorporates GetIt, a simple yet powerful service locator, to manage dependencies
   effectively. With GetIt, you can access dependencies throughout the app, decoupling the code and
   making it easier to swap implementations during testing or future updates.

6. **Clean Architecture:**
   Clean Architecture is an architectural pattern that emphasizes separation of concerns and layers
   in your codebase. The boilerplate template follows Clean Architecture principles, which include
   separating the app into three main layers: `data`, `domain`, and `presentation`. The `data` layer
   handles data sources and repositories, the `domain` layer contains business logic and entities,
   while the `presentation` layer handles the UI and user interactions. Clean Architecture promotes
   code reusability, maintainability, and testability, making your app scalable and easier to
   maintain as it grows.

7. **Logger and Tracking manager**
   The logger provides functionality to record and display various levels of messages (debug, info, warning, error) during the execution the application. It helps in monitoring application behavior and diagnosing issues. Our boilerplate provides both abstraction and implementation using `logging` library. But if someone wants to implement custom logger then there are oppertunity to do so. 
   The tracking manager facilitates integration with analytics services to monitor user interactions, events, and performance metrics within the app. It supports tracking custom events and parameters to gain insights into user behavior. Our boilerplate provides both abstraction and implementation with `sentry tracking manager` with the help of our `logger` library. If there are need to use any other proccesses, please implement the abstraction.

8. **Theme & Styling**
   In mobile apps, a theme dictates the overall visual style, including colors, typography, and design elements, ensuring a consistent and appealing user interface that reflects the app's brand and enhances user experience. Our boilerplate provide abstraction to incorporate custom theme by providing `colorScheme` or `seedColor`. It also comes with widgets and blocs for incorporating theme changes throughout the application.
   In Styles, We can define how visual attributes like fonts, colors, and spacing are applied across widgets, ensuring consistent and customizable UI designs throughout the project. 

9. **Alerts & Loading**
   In a mobile application, Alerts and loadings are a common features to have. It is essential to have consistant alert and loading throughout the application. In our boilerplate, we provide abstraction of many types of alerts, there is also abstraction for loading. When using, implement the needed alerts and loader to use throught the application.

10. **Utilities, extensions & validators**
    Utilities, extensions and validators make our life as a developer much easier to develop applications. In our boilerplate, we tried to create an idea on where to define these features and how to use them consistantly throughout the application. 

11. **Common Services**
    When developing using microfrontend architecture, there can be a need to use same classes, entities, layout, widgets throughout all the micro apps. In common services library, we tried to incorporate those requirements. As we are using clean architecture, there can be need of common models and abstract classes in `data` layer, common entities and abstraction for use cases in the `domain` layer. There can be a need for common layouts and common widget gallery for `presentation` layer. In common services, we tried to give an idea on how we can structure them and use them consistently throughout all the micro frontends.

12. **Build Environments**
    In full development lifecycle, there can be a need to have multiple build enviroments in multiple stages. There can be a need for `development` environment for developing stages of the application, a need for `staging` environment for UAT and a need for `production` enviroment for rolling out the application. In our boilerplate, we tried to incorporate these environment and flavours to use in different stages of the development lifecycle. Of course there are opportunities to incorporate other enviroment if needed through provided abstraction.

13. **Routing and navigation**
    Routing and navigation is an essential feature to have in application development. We used `go_router`, A declarative routing package for Flutter that uses the Router API to provide a convenient, url-based API for navigating between different screens. You can define URL patterns, navigate using a URL, handle deep links, and a number of other navigation-related scenarios. 
    In microfrontend development, we can separate navigation between different micro apps through `Navigator` widget and `routeDelegate` in `go_router` to generate different route. 


 

## Getting Started

To start using this boilerplate template, follow these steps:

1. **Clone the Repository:**
   Clone this repository to your local development environment using Git.

2. **Install Dependencies:**
   Ensure you have Flutter and Dart SDK installed on your machine. Run `flutter doctor` to verify
   the installation. Then, install the required dependencies using `flutter pub get`.

3. **Explore and Customize:**
   Familiarize yourself with the project structure and files. Customize the template according to
   your project requirements, such as renaming files, adding Blocs, creating API clients,
   registering dependencies, and updating localization files for different locales.

4. **Build Your App:**
   Leverage the provided features and architecture to build your Flutter app efficiently. Utilize
   the state management, localization, error handling, network calls, local storage, and dependency
   injection features to deliver a high-quality and user-friendly application.\

## TODO List

- [ ] Fix bug #1
- [ ] Write unit tests
- [ ] Add documentation
   - [ ] Update README.md
   - [ ] Generate API documentation
- [ ] Conduct code review
- [ ] Address feedback from code review
- [ ] Perform integration testing
- [ ] Release version 1.0.0

## Contribution

We welcome contributions to this boilerplate template. If you find any issues, have suggestions for
improvements, or want to add new features, feel free to raise an issue or submit a pull request.
Your contributions will help the Flutter community benefit from this template and build better apps.


## Acknowledgments

This boilerplate template is provided by Brain Station 23 Ltd, a leading technology company known
for its expertise in software development. We thank Brain Station 23 Ltd for creating and sharing
this template with the Flutter community, helping developers get started with robust and
feature-rich Flutter applications.

Happy coding!
