import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sw2project/model/userModel.dart';

class User extends ChangeNotifier {
  late String _username;
  late String _email;
  late String _phoneNumber;
  late String _password;
  late bool _activated;
  late List<String> _area;
  late String _userType;

  late List<UserModel> _users;

  List<UserModel> get users => _users;

  String get username => _username;

  String get email => _email;

  String get phoneNumber => _phoneNumber;

  String get password => _password;

  bool get activated => _activated;

  List<String> get area => _area;

  String get userType => _userType;

  setUsername(String username) {
    _username = username;
    notifyListeners();
  }

  setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  setPhoneNumber(String phone) {
    _phoneNumber = phone;
    notifyListeners();
  }

  setPassword(String pass) {
    _password = pass;
    notifyListeners();
  }

  setActivated(bool activate) {
    _activated = activate;
    notifyListeners();
  }

  setArea(List<String> area) {
    _area = area;
    notifyListeners();
  }

  setUserType(String type) {
    _userType = type;
    notifyListeners();
  }

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  signIn() async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      log('signed in');
    } catch (e) {
      log(e.toString());
    }
  }

  signUp() async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      firestore.collection('users').add({
        'username': username,
        'email': email,
        'phone': phoneNumber,
        'password': password,
        'activated': userType == 'driver' ? false : true,
        'userType': userType,
        'rate': 0
      });
      log('signed up');
    } catch (e) {
      log(e.toString());
    }
  }

  logOut() async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      log(e.toString());
    }
  }

  getAllUsers() async {
    QuerySnapshot querySnapshot;
    try {
      querySnapshot = await firestore.collection('users').get();
      if (querySnapshot.docs.isNotEmpty) {
        log(querySnapshot.docs[0].id.toString());
      } else {
        log('no data');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  getOnlyOneUser() async {
    QuerySnapshot querySnapshot;
    try {
      firestore
          .collection('users')
          .doc('xT1Z9XtfhcUh4W2rR2mR')
          .get()
          .then((user) {
        log(user['email']);
      });
    } catch (e) {
      log(e.toString());
    }
  }

  activateAccount(String userId, bool activate) async {
    try {
      await firestore.collection('users').doc(userId).update({
        'activated': activate,
      });
    } catch (e) {}
  }

  addRate(String userId, int rate) async {
    try {
      await firestore.collection('users').doc(userId).update({
        'rate': rate,
      });
    } catch (e) {}
  }


}
