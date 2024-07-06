import 'package:spotify_app/core/usecase/useCase.dart';
import 'package:spotify_app/data/models/auth/create_user_req.dart';
import 'package:dartz/dartz.dart';
import 'package:spotify_app/domain/repositery/auth/auth.dart';
import 'package:spotify_app/serviceLocator.dart';




class SignupUseCase implements UseCase<Either,CreateUserReq>{
  @override
  Future<Either> call({CreateUserReq? params}) {
   return      s1<AuthRepository>().signUp(params!);

  }
}