import 'package:spotify_app/data/models/auth/create_user_req.dart';
import 'package:dartz/dartz.dart';
import 'package:spotify_app/data/models/auth/signInUserRE.dart';
abstract class AuthRepository{
  Future<Either>signUp(CreateUserReq createUserReq);
  Future<Either>SignIn(SignInUserReQ signInUserReQ);

}