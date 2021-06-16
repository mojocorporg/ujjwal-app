# Ujjwal App

Flutter app for lead generation

## Install and run Flutter

Install Flutter for your operating system from here
https://flutter.dev/docs/get-started/install

Install VS Code (https://code.visualstudio.com/download) or Android Studio (https://developer.android.com/studio)


## Build app folder

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/mojocorporg/ujjwal-app.git
```

**Step 2:**

Open the `ujjwal` folder in any desired app.
Open terminal/command prompt and run following commands in the project folder

`flutter clean`
`flutter  pub get`

This should remove any visible errors.

Attach a device or run a simulator and enter below commands to run the app
`flutter build android`
`flutter build ios`

This app is using firebase for mobile authentication and push notifications


## RazorPay Setup

`/libs/helper/config.dart` open this file and replace your live key at line `20`


## Getx Refrence

We are using Getx as a state management solution for this project. Please visit `https://pub.dev/packages/get` for more info.

### Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- assets
|- build
|- ios
|- lib
|- test
```

Here is the folder structure we have been using in this project

```
lib/
|- binding/
|- controller/
|- helper/
|- locale/
|- model/
|- repository/
|- screen/
|- widget/
|- main.dart
```

Now, lets dive into the lib folder which has the main code for the application.

```
1- model - Contains the data layer of your project, includes directories for local, network and shared pref/cache.
2- locale - Contains the language files, any added language files have to be put here
3- controller - Contains store(s) for state-management of your application, to connect the reactive data of your application with the UI. 
4- screen — Contains all the ui of your project, contains sub directory for each screen.
5- helper — Contains the utilities/common functions of your application.
6- widgets — Contains the common widgets for your applications. For example, Button, TextField etc.
8- main.dart - This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.
```

### Routes

`/lib/helper/routes.dart`This file contains all the routes for your application.

```dart

import 'package:ujjwal/binding/business_detail_binding.dart';
import 'package:ujjwal/binding/on_boarding_binding.dart';
import 'package:ujjwal/binding/pager_binding.dart';
import 'package:ujjwal/binding/login_binding.dart';
import 'package:ujjwal/screen/business_details_screen.dart';
import 'package:ujjwal/screen/login_screen.dart';
import 'package:ujjwal/screen/on_boarding_screen.dart';
import 'package:ujjwal/screen/pager_screen.dart';
import 'package:ujjwal/screen/splash_screen.dart';
import 'package:ujjwal/screen/referral_screen.dart';

import 'package:get/get.dart';

class Routes {
  static final route = [
    GetPage(
      name: '/splash',
      page: () => SplashScreen(),
    ),
    GetPage(
      name: '/login',
      page: () => LoginScreen(),
      binding: LoginBinding()
    ),
    GetPage(
      name: '/pager',
      page: () => PagerScreen(),
      binding: PagerBinding()
    ),
    GetPage(
      name: '/businessDetail',
      page: () => BusinessDetailScreen(),
      binding: BusinessDetailBinding(),
    ),
    GetPage(
      name: '/referral',
      page: () => ReferralScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: '/onBoarding',
      page: () => OnBoardingScreen(),
      binding: OnBoardingBinding(),

    ),

  ];
}
```

### Main

This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation, localization etc.

```dart
import 'helper/routes.dart';
import 'helper/shared_prefs.dart';
import 'helper/strings.dart';
import 'locale/LocalizationService.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  UserPreferences().init();

  runApp(
    GetMaterialApp(
      title: Strings.app_name,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.rightToLeft,
      getPages: Routes.route,
      initialRoute: '/splash',
      textDirection: TextDirection.ltr,
      locale: LocalizationService.locale,
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
      theme: ThemeData(
        primaryColor: Color(0xFF373A4C),
        primaryColorDark: Color(0xFF444966),
        primaryColorLight: Colors.pink[300],
        accentColor: Colors.pinkAccent,
        backgroundColor: Color(0xFF214151),
      ),
      darkTheme: ThemeData(
        primaryColor: Colors.black45,
        primaryColorDark: Colors.black87,
      ),
      themeMode: ThemeMode.light,
    ),
  );
}
```

## Conclusion

I will be happy to answer any questions that you may have regarding the setup, Thanks.
