import 'package:bloc_learning/common/network/api_services.dart';
import 'package:bloc_learning/pages/product/data/product_repository_iml.dart';
import 'package:bloc_learning/pages/product/domain/repositery/product_repositery.dart';
import 'package:bloc_learning/pages/product/domain/usecase/prduct_usecase.dart';
import 'package:bloc_learning/pages/product/presentation/bloc/product_bloc.dart';
import 'package:bloc_learning/pages/signUp/data/sign_up_repository_impl.dart';
import 'package:bloc_learning/pages/signUp/domain/repositery/signup_repositery.dart';
import 'package:bloc_learning/pages/signUp/domain/usecases/sign_up_usecase.dart';
import 'package:bloc_learning/pages/signUp/presentation/bloc/sign_up_bloc.dart';
import 'package:bloc_learning/pages/signin/data/repositories/auth_repository_impl.dart';
import 'package:bloc_learning/pages/signin/domain/repositery/auth_repositery.dart';
import 'package:bloc_learning/pages/signin/domain/usecases/sign_in_usecase.dart';
import 'package:bloc_learning/pages/signin/presentation/bloc/signin_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

// Create a GetIt instance
final GetIt getIt = GetIt.instance;

void setupLocator() {
  // Register FirebaseAuth instance
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  // Register AuthRepository implementation
  getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(getIt<FirebaseAuth>()));

  // Register SignInUseCase
  getIt.registerLazySingleton<SignInUseCase>(
      () => SignInUseCase(getIt<AuthRepository>()));

  // Register SigninBloc
  getIt.registerFactory<SigninBloc>(() => SigninBloc(getIt<SignInUseCase>()));

  getIt.registerLazySingleton<SignUpRepositery>(
      () => SignUpRepositeryImple(getIt<FirebaseAuth>()));
  getIt.registerLazySingleton<SignUpUseCase>(
      () => SignUpUseCase(getIt<SignUpRepositery>()));
  getIt.registerFactory<SignUpBloc>(() => SignUpBloc(getIt<SignUpUseCase>()));



  getIt.registerSingleton<ApiServices>(ApiServices("https://dummyjson.com"));
  getIt.registerLazySingleton<ProductRepositery>(
      () => ProductRepositeryImpl(getIt<ApiServices>()));

  getIt.registerLazySingleton<ProductUseCase>(
      () => ProductUseCase(getIt<ProductRepositery>()));

  getIt
      .registerFactory<ProductBloc>(() => ProductBloc(getIt<ProductUseCase>()));

}
/**
 * registerLazySingleton

 *What it is:
    This tells GetIt to create one single instance of a class and reuse that instance whenever it's needed.

 *  How it works:
    The instance is created lazily, meaning it’s only created the first time someone asks for it.

 *  When to use it:
    Use registerLazySingleton when you want a single instance of a class to be shared across the entire app,
    such as for things like services or repositories (e.g., FirebaseAuth, API services, or a database service).


 * registerFactory

 * What it is:
    This tells GetIt to create a new instance of a class every time it is requested.

 *How it works:
    Each time you ask for this class, a brand new object is created.

 *When to use it:

    Use registerFactory when you need a new instance every time it’s called,
    like for UI-related elements such as Blocs or ViewModels,
    which often need fresh data when navigating between screens.
 */
