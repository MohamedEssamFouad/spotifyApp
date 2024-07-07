import 'package:get_it/get_it.dart';
import 'package:spotify_app/data/repository/auth/auth_repostiory.dart';
import 'package:spotify_app/data/repository/song/song_repostory_imp.dart';
import 'package:spotify_app/data/sources/songs/song.dart';
import 'package:spotify_app/domain/repositery/auth/auth.dart';
import 'package:spotify_app/domain/repositery/song/song.dart';
import 'package:spotify_app/domain/usecases/auth/signIn.dart';
import 'package:spotify_app/domain/usecases/auth/signUp.dart';
import 'package:spotify_app/domain/usecases/song/get_nes_songs.dart';

import 'data/sources/auth/auth_firebaseServise.dart';

final s1=GetIt.instance;

Future<void>initializedDependencies()async{

  s1.registerSingleton<AuthFireBase>(
    AuthFireBaseImplemention()
  );
  s1.registerSingleton<SongFirebaseServices>(
      SongsFireBaseimPLE()
  );
  s1.registerSingleton<SongsRepository>(
      SongRepostoryImpl()
  );
  s1.registerSingleton<AuthRepository>(
      AuthReposImplemetion()
  );

  s1.registerSingleton<SignupUseCase>(
      SignupUseCase()
  );
  s1.registerSingleton<SignInUseCase>(
      SignInUseCase()
  );
  s1.registerSingleton<GetNewsSongsUseCase>(
      GetNewsSongsUseCase()
  );
}