import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
 

// import '../../models/user_model.dart' as lizitUser;

class AuthService {
  final FirebaseAuth _firebaseAuth;

  AuthService(this._firebaseAuth);

  ///signIn
  Future<dynamic> signIn(
      {required String email, required String password}) async {
    String errorMessage = '';
    try {
      return await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your email address appears to be malformed.";
          break;
        case "wrong-password":
          errorMessage = "Your password is wrong.";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
    }
    return errorMessage;
  }

  ///signUp can be UserCredential or error string code
  Future<dynamic> signUp(
      {required String email, required String password}) async {
    String errorMessage = '';

    try {
      // Returns an UserCredential
      return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (error) {
      // Returns an error message
      switch (error.code) {
        case "email-already-in-use":
          errorMessage =
              "There is an account already registered with this email.";
          break;
        case "invalid-email":
          errorMessage = "Your email address appears to be malformed.";
          break;
        case "weak-password":
          errorMessage = "Password is too weak.";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
      return errorMessage;
    }
  }

  ///sendPasswordReset
  Future<String> sendPasswordReset(String email) async {
    String errorMessage = "";
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your email address appears to be malformed.";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
    }
    return errorMessage;
  }

  ///Change password
  Future<String> changePassword(
    String currentPassword,
    String email,
    String newPassword,
  ) async {
    try {
      var _signInStatus = await signIn(email: email, password: currentPassword);
      if (_signInStatus.isEmpty) {
        var user = _firebaseAuth.currentUser;

        await user!.updatePassword(newPassword);

        return "success";
      } else {
        return "error";
      }
    } catch (err) {
      debugPrint(err.toString());
      return "error";
    }
  }

  ///SignOut
  Future<bool> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return true;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  ///Get Currentuser
  User? getCurrentUser() {
    try {
      return _firebaseAuth.currentUser;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  // Future<lizitUser.User?> getCurrentUserHome() async {
  //   try {
  //     return (await usersService.getCurrentUser())!;
  //   } on FirebaseAuthException catch (e) {
  //     debugPrint(e.toString());
  //   }
  //   return null;
  // }
}

final AuthService auth = AuthService(FirebaseAuth.instance);
