import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Emulators {
  static var host = Platform.isAndroid ? '10.0.2.2' : 'localhost';
  static var _firebaseAuth = FirebaseAuth.instance;
  static var _firebaseFirestore = FirebaseFirestore.instance;
  // static var _firebaseStorage = FirebaseStorage.instance;
  // static var _firebaseFunction = FirebaseFunctions.instance;

  static void auth() {
    var port = 9099;
    try {
      _firebaseAuth.useAuthEmulator(host, port).then((value) async {
        await _firebaseAuth.setSettings(
            appVerificationDisabledForTesting: true);
        debugPrint('--- Using Authentication emulator on: $host:$port --- 🔥');
      });
    } on FirebaseAuthException catch (exception) {
      debugPrint(exception.message);
    }
  }

  static void firestore() {
    var port = 8080;
    try {
      _firebaseFirestore.settings = Settings(
        host: '$host:$port',
        sslEnabled: false,
        persistenceEnabled: false,
      );
      _firebaseFirestore.useFirestoreEmulator(host, port);
      debugPrint('--- Using Firestore emulator on: $host:$port --- 🔥');
    } on FirebaseException catch (exception) {
      debugPrint(exception.message);
    }
  }

  // static void storage() {
  //   var port = 9199;
  //   try {
  //     _firebaseStorage.useStorageEmulator(host, port).then((value) =>
  //         debugPrint('--- Using Storage Emulator on: $host:$port --- 🔥'));
  //   } on FirebaseException catch (exception) {
  //     debugPrint(exception.message);
  //   }
  // }

  // static void functions() {
  //   var port = 5001;
  //   try {
  //     FirebaseFunctions.instance.useFunctionsEmulator(host, port);
  //     debugPrint('--- Using Cloud Functions emulator on: $host:$port --- 🔥');
  //   } on FirebaseFunctionsException catch (exception) {
  //     debugPrint(exception.message);
  //   }
  // }
}
