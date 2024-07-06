import 'package:spotify_app/core/usecase/useCase.dart';
import 'package:dartz/dartz.dart';
import 'package:spotify_app/data/models/auth/signInUserRE.dart';
import 'package:spotify_app/domain/repositery/auth/auth.dart';
import 'package:spotify_app/serviceLocator.dart';




class SignInUseCase implements UseCase<Either,SignInUserReQ>{
  @override
  Future<Either> call({SignInUserReQ? params}) {
    return      s1<AuthRepository>().SignIn(params!);

  }
}