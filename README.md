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
   injection features to deliver a high-quality and user-friendly application.



## Usage
   Now lets delve deeply into the usage of our developed common microfrontends. Lets discuss how we can use them in our applications and incorporate them consistently.

   ### Alets & loading
   We have an abstract `Alert` class, which has initially `success`, `error`, `warning`, `info` and `confirmation` functionalities. Please implement those functionalities per your requirement needs. Feel free to add other alerts here as per your need.

   ```dart
        class SuccessAlert extends Alert {
         final BuildContext context;
         final String title;
         final String content;
         final String confirmText;
         final VoidCallback onConfirm;

         const SuccessAlert({
            required this.context,
            required this.title,
            required this.content,
            this.confirmText = "OK",
            required this.onConfirm,
         });

         @override
         void show() {
            throw UnimplementedError();
         }
      }
   ```

   Also we have an abstract `Loading` class with `show` and `hide` functionalilites. Feel free to add the implementation as per your requirements and needs.

   ```dart
         class ShowLoading extends Loading {
            final BuildContext context;
            String message;

            ShowLoading({
               required this.context,
               this.message = "Loading...",
            });
            @override
            void execute() {
               throw UnimplementedError();
            }
         }
   ```


   ### Api Base
   Api Base library provides abstract `ApiBase` class with `get`, `post`, `path`, `delete` functionalities. It is currently implemented using dio in the abstract class `DioApiBase`. Please implement them for each of your apis. 

   ```dart
         class LoginApi
            extends DioApiBase<LoginRequest, AuthTokenResponse, AuthErrorResponse> {
         LoginApi() : super(Links.loginUrl);

         @override
         AuthErrorResponse mapError({String? message, Map<String, dynamic>? json}) {
            throw UnimplementedError();
         }

         @override
         AuthTokenResponse mapResponse(Map<String, dynamic> json) {
            throw UnimplementedError();
         }

         @override
         Map<String, String> get headers => throw UnimplementedError();
         }
   ```

   `DioApiBase` uses 2 abstract class `ApiRequest` and `ApiResponse` to get request data and send response. When using please implement them as well

   ```dart
         class LoginRequest extends ApiRequest {
         final String accountCode;
         final String password;
         LoginRequest(this.accountCode, this.password);

         @override
         Map<String, dynamic> toJson() {
            return {
               "accountCode": accountCode,
               "password": password,
            };
         }
       }


         class AuthTokenResponse extends ApiResponse {
         final String accessToken;
         final String refreshToken;

         AuthTokenResponse(
            this.accessToken,
            this.refreshToken,
         );

         factory AuthTokenResponse.fromJson(Map<String, dynamic> json) {
            return AuthTokenResponse(
               json["accessToken"],
               json["refreshToken"],
            );
         }

         AuthTokens toEntity() {
            return AuthTokens(accessToken: accessToken, refreshToken: refreshToken);
         }
        }

         abstract class AuthErrorResponse<T> extends ApiResponse {

         T toEntity();
        }

   ```

   When calling the api, it may be used as

   ```dart
      Either<AuthTokenResponse, AuthErrorResponse> response =
         await LoginApi().post(request);
   ```

   If it is used like this, then every api will return a response or an error type safely

   ### Biometric Auth
   `BiometricAuth` is a small but helpful library that can provide biometric authentication feature easily. It is currently implemented using  `local_auth` in the `LocalAuthImpl` class. If needed, it can be implemented using other library as well by implementing the abstract `BiometricAuth` class

   ```dart
         abstract class BiometricAuth{
            Future<bool> canCheckBiometric();
            Future<bool> authenticateWithBiometric();
         }

   ```

   ### Local Storage
   `local_storage` library is used for saving data locally. It provides abstract `LocalStorageBase` class for basic usecase of saving data locally. There is also an implementation using `shared_preference` is provided in the `SharedPreferenceBase` class.If there is a need for other library to be used, please provide implementation of `LocalStorageBase` class. There is also an abstract class `BaseLocalData` for saving data. Please extend this class to the data you want to save

   ```dart
         class TokensLocalApi extends SharedPreferenceBase<AuthTokenLocalData> {
            TokensLocalApi(super.preference);

            @override
            AuthTokenLocalData mapResponse(Map<String, dynamic> json) {
               return AuthTokenLocalData.fromJson(json);
            }

            @override
            String get key => ConstantStrings.tokenKey;
         }


         // the local data to be saved
         class AuthTokenLocalData extends BaseLocalData<AuthTokens> {
            final String accessToken;
            final String refreshToken;

            AuthTokenLocalData(
               this.accessToken,
               this.refreshToken,
            );

            factory AuthTokenLocalData.fromJson(Map<String, dynamic> json) {
               return AuthTokenLocalData(json["accessToken"], json["refreshToken"]);
            }

            @override
            AuthTokens toEntity() {
               return AuthTokens(accessToken: accessToken, refreshToken: refreshToken);
            }

            @override
            Map<String, dynamic> toJson() {
               return {"accessToken": accessToken, "refreshToken": refreshToken};
            }
         }

   ```

   ### Localization
   For localization, there is an abstract class `LocalizationBase` for managing localization. Currently in our boilerplate, we used `slang` to implement the `LocalizationBase` in the `SlangLocalizationImpl` class. If you want to use other implementation for localization, please implement the `LocalizationBase` class.

   ```dart
         abstract class LocalizationBase<LocaleType, TranslationType> {
            void initializeLocalization(String languageCode);

            Widget localizationScope({required Widget child});

            Locale currentLocale(BuildContext context);

            List<Locale> get supportedLocale;

            List<LocalizationsDelegate<void>> get localizationsDelegates;

            void changeLocale(LocaleType locale);

            TranslationType text(BuildContext context);
         }

   ```

   ### Logger
   For logging there is an abstract class `LoggerBase` for managing logging. 
      
   ```dart
         /// Logs the error to the console
         void error(Object message, {Object? error, StackTrace? stackTrace});

         /// Logs the warning to the console
         void warning(Object message);

         /// Logs the info to the console
         void info(Object message);

         /// Logs the debug to the console
         void debug(Object message);

         /// Logs the verbose to the console
         void verbose(Object message);
 
   ```

   In our boilerplate, `LoggerBase` is implemented using `logging` library in the `Logger` class.

   ### Tracking Manager
   For tracking errors and warning, there is an abstract class called `ErrorTrackingManagerBase`. In our boilerplate, We implemented `ErrorTrackingManagerBase` using `sentry` in the `SentryTrackingManager`. Please implement `ErrorTrackingManagerBase` if you want to use other custom implementation yourself.

   ### Theme
   For theme we have provided abstract `ThemeBase` class. By implementing this class we can provide `seedColor` or `colorScheme` along with `themeMode` generate `AppTheme` . `AppTheme` provides `themeData` to be used in the application. 

    ```dart
         final class ThemeImpl extends ThemeBase {
         final ThemeMode mode;
         ThemeImpl({
            required this.mode,
         });

         @override
         ThemeMode get themeMode => mode;

         @override
         // TODO: implement colorScheme
         ColorScheme? get colorScheme => throw UnimplementedError();
         }

    ```  

   It also provides `ThemeCubit` for handling theme change through `ThemeScope` widget


   
   ### Putting it all together
   In the main app level, everything is put into place to use in the application. In the application level `AppStorage` class is provided to store dependencies such as other microfrontends. Feel free to add your microfrontend in the `AppStorage`.

   ```dart

         ///[AppStorage] holds [themeCubit], [errorTrackingManager], [localization] to use in everywhere
         ///It can also be used to feed dependencies across the application
         ///If there are need for any other dependencies to be need. Please incorporate it in [AppStorage]
         class AppStorage {
         AppStorage({
            required this.themeCubit,
            required this.errorTrackingManager,
            required this.localization,
         });

         final ThemeCubit themeCubit;
         final ErrorTrackingManager errorTrackingManager;
         final LocalizationBase localization;
         }


         DefaultAssetBundle(
            bundle: SentryAssetBundle(),
            child: RepositoryProvider<AppStorage>(
            create: (context) => widget.appStorage,
            child: ThemeScope(
               themeCubit: widget.appStorage.themeCubit,
               child: widget.appStorage.localization.localizationScope(
                  child: const AppContext(),
               ),
            ),
            ),
         ) 



         class AppContext extends StatelessWidget {
         const AppContext({super.key});

         // This global key is needed for [MaterialApp]
         // to work properly when Widgets Inspector is enabled.
         static final _globalKey = GlobalKey();
         @override
         Widget build(BuildContext context) {
            final ThemeBase theme = ThemeScope.of(context);
            final AppStorage appStorage = RepositoryProvider.of(context);
            return MaterialApp.router(
               theme: theme.themeData,
               themeMode: theme.themeMode,
               routerConfig: RouteGenerator.router,
               locale: appStorage.localization.currentLocale(context),
               supportedLocales: appStorage.localization.supportedLocale,
               localizationsDelegates: appStorage.localization.localizationsDelegates,
               // TODO: You may want to override the default text scaling behavior.
               builder: (context, child) => MediaQuery.withClampedTextScaling(
               key: _globalKey,
               minScaleFactor: 1.0,
               maxScaleFactor: 2.0,
               child: child!,
               ),
            );
         }
         }





   ```




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

This boilerplate template is provided by Brain Station 23 PLC, a leading technology company known
for its expertise in software development. We thank Brain Station 23 Ltd for creating and sharing
this template with the Flutter community, helping developers get started with robust and
feature-rich Flutter applications.

Happy coding!
