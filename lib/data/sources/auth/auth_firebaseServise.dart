import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_app/data/models/auth/create_user_req.dart';
import 'package:dartz/dartz.dart';
import 'package:spotify_app/data/models/auth/signInUserRE.dart';

abstract class AuthFireBase{
  Future<Either>SignIn(SignInUserReQ signInUserReQ);
  Future<Either>SignUp(CreateUserReq createUserReq);
}

class AuthFireBaseImplemention extends AuthFireBase{
  @override
  Future<Either> SignIn(SignInUserReQ signInUserReQ)async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signInUserReQ.email,
        password: signInUserReQ.password,
      );
      return Right('SignIn was successful');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'invalid-email') {
        message = 'The password provided errorrr';
      } else if (e.code == 'invalid-credential') {
        message = 'wrong for that user';
      } else {
        message = 'Signup failed. Error: ${e.message}';
      }
      return Left(message);
    } catch (e) {
      return Left('Signup failed. Error: $e');
    }
  }

  @override
  Future<Either> SignUp(CreateUserReq createUserReq) async{
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password,
      );
      return Right('Signup was successful');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account with this email already exists';
      } else {
        message = 'Signup failed. Error: ${e.message}';
      }
      return Left(message);
    } catch (e) {
      return Left('Signup failed. Error: $e');
    }
  }
}