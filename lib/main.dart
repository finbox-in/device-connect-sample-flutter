// ### UNCOMMENT AND COPY THIS FILE TO
// ### ROOT/lib/main.dart

import 'package:either_dart/either.dart';
import 'package:finbox_dc_plugin/finbox_dc_plugin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants.dart';
import 'common.dart';

void main() {
  runApp(MyApp(key: null,));
}

/// The root widget of the application.
///
/// This widget is the starting point of the Flutter application and is
/// responsible for initializing the app's state and building the main
/// user interface. It extends [StatefulWidget] to manage its internal state.
///
class MyApp extends StatefulWidget {
  /// Creates the root widget of the application.
  ///
  /// The [key] parameter is optional and can be used to control the widget's
  /// identity in the widget tree.
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}



/// The main screen of the application.
///
/// This widget displays a list of buttons that allow the user to interact
/// with the FinBox Device Connect SDK. It extends [StatelessWidget] as it
/// does not manage any internal state.
///
/// The [HomePage] widget provides buttons to perform actions such as:
///   - Creating a user
///   - Setting device match data
///   - Setting the sync frequency
///   - Starting and stopping periodic sync
///   - Syncing individual data points
///   - Resetting data
///   - Forgetting the user
///
/// Each button triggers a corresponding method that interacts with the
/// FinBox Device Connect SDK via the `FinBoxDcPlugin`.
///
class HomePage extends StatelessWidget {

  /// Creates a new user using the FinBox Device Connect SDK.
  ///
  /// This method calls the `createUser` method of the `FinBoxDcPlugin`
  /// and prints the result to the console.
  _createUser() {
    try {
      final customerId = CommonUitl.getUsername();
      print("Customer ID: ${customerId}");
      final hello = FinBoxDcPlugin.createUser(
          Constants.CLIENT_API_KEY, customerId);
      hello.fold(
              (left) => {
            // error response
            print("Error: $left")
          },
              (right) => {
            // success response
            print("Access Token: $right")
          });
    } on PlatformException catch (e) {
      print('Failed to fetch data: ${e.message}');
    }
  }

  /// Starts periodic data synchronization using the FinBox Device Connect SDK.
  ///
  /// This method calls the `startPeriodicSync` method of the `FinBoxDcPlugin`.
  _startPeriodicSync() {
    FinBoxDcPlugin.startPeriodicSync();
  }

  /// Stops periodic data synchronization using the FinBox Device Connect SDK.
  ///
  /// This method calls the `stopPeriodicSync` method of the `FinBoxDcPlugin`.
  _stopPeriodicSync() {
    FinBoxDcPlugin.stopPeriodicSync();
  }

  /// Synchronizes SMS data using the FinBox Device Connect SDK.
  ///
  /// This method calls the `syncSmsData` method of the `FinBoxDcPlugin`.
  _syncSmsData() {
    FinBoxDcPlugin.syncSmsData();
  }

  /// Synchronizes location data using the FinBox Device Connect SDK.
  ///
  /// This method calls the `syncLocationData` method of the `FinBoxDcPlugin`.
  _syncLocationData() {
    FinBoxDcPlugin.syncLocationData();
  }

  /// Synchronizes device data using the FinBox Device Connect SDK.
  ///
  /// This method calls the `syncDeviceData` method of the `FinBoxDcPlugin`.
  _syncDeviceData() {
    FinBoxDcPlugin.syncDeviceData();
  }

  /// Synchronizes data using the FinBox Device Connect SDK only once.
  ///
  /// This method calls the `syncOnce` method of the `FinBoxDcPlugin`.
  _syncOnce() {
    FinBoxDcPlugin.syncOnce();
  }

  /// Synchronizes the list of installed apps using the FinBox Device Connect SDK.
  ///
  /// This method calls the `syncAppsListData` method of the `FinBoxDcPlugin`.
  _syncAppsListData() {
    FinBoxDcPlugin.syncAppsListData();
  }

  /// Sets the data synchronization frequency using the FinBox Device Connect SDK.
  ///
  /// This method calls the `setSyncFrequency` method of the `FinBoxDcPlugin`.
  _setSyncFrequency() {
    FinBoxDcPlugin.setSyncFrequency(36000);
  }

  /// Resets all user data using the FinBox Device Connect SDK.
  ///
  /// This method calls the `resetData` method of the `FinBoxDcPlugin`.
  _resetData() {
    FinBoxDcPlugin.resetData();
  }

  /// Forgets the current user using the FinBox Device Connect SDK.
  ///
  /// This method calls the `forgetUser` method of the `FinBoxDcPlugin`.
  _forgetUser() {
    FinBoxDcPlugin.forgetUser();
  }

  /// Sets the device match data using the FinBox Device Connect SDK.
  ///
  /// This method calls the `setDeviceMatch` method of the `FinBoxDcPlugin`.
  _setDeviceMatch() {
    FinBoxDcPlugin.setDeviceMatch("email", "userName", "phone");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Device Connect Sample"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _createUser,
              child: Text("Create User"),
            ),
            ElevatedButton(
              onPressed: _setDeviceMatch,
              child: Text("Set Device Data"),
            ),
            ElevatedButton(
              onPressed: _setSyncFrequency,
              child: Text("Set Sync Frequency"),
            ),
            ElevatedButton(
              onPressed: _startPeriodicSync,
              child: Text("Start Periodic Sync"),
            ),
            ElevatedButton(
              onPressed: _stopPeriodicSync,
              child: Text("Stop Periodic Sync"),
            ),
            ElevatedButton(
              onPressed: _resetData,
              child: Text("Reset Data"),
            ),
            ElevatedButton(
              onPressed: _forgetUser,
              child: Text("Forget User"),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
