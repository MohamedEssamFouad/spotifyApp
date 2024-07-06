import 'package:spotify_app/data/models/auth/create_user_req.dart';
import 'package:spotify_app/data/models/auth/signInUserRE.dart';
import 'package:spotify_app/data/sources/auth/auth_firebaseServise.dart';
import 'package:spotify_app/domain/repositery/auth/auth.dart';
import '../../../serviceLocator.dart';
import 'package:dartz/dartz.dart';

class AuthReposImplemetion extends AuthRepository{
  @override
  Future<Either> SignIn(SignInUserReQ signInUserReQ) async{
    return await s1<AuthFireBase>().SignIn(signInUserReQ);

  }

  @override
  Future<Either> signUp(CreateUserReq createUserReq) async {
    return await s1<AuthFireBase>().SignUp(createUserReq);
  }

}