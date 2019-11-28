import 'package:bloc/bloc.dart';
import 'package:ciclo_helper/maintenance/maintenance.dart';
import 'package:ciclo_helper/maintenance/maintenance_list_bloc/bloc.dart';
import 'package:ciclo_helper/my_bike/my_bike_list_bloc/my_bike_list_bloc.dart';
import 'package:ciclo_helper/my_bike/my_bike.dart';
import 'package:ciclo_helper/home_page.dart';
import 'package:ciclo_helper/splash_screen.dart';
import 'package:ciclo_helper/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ciclo_helper/authentication_bloc/bloc.dart';

import 'login/login.dart';


void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  WidgetsFlutterBinding.ensureInitialized();
  final UserRepository userRepository = UserRepository();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          builder: (BuildContext) => AuthenticationBloc(userRepository: userRepository)
            ..add(AppStarted()) ,
        ),
        BlocProvider<MyBikeBloc>(
          builder: (BuildContext) => MyBikeBloc()..add(LoadedMyBike()),
        ),
        BlocProvider<MaintenanceBloc>(
          builder: (BuildContext) => MaintenanceBloc()..add(LoadedMaintenance()),
        ),
      ],
      child:  MyApp(userRepository: userRepository),
    )
  );
}

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}

class MyApp extends StatelessWidget {

//  MyBikeBloc _myBikeBloc = MyBikeBloc();
  final UserRepository _userRepository;

  MyApp({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MyBikeListBloc>(
          builder: (BuildContext) => MyBikeListBloc(myBikeBloc: BlocProvider.of<MyBikeBloc>(context)),
        ),
        BlocProvider<MaintenanceListBloc>(
          builder: (BuildContext) => MaintenanceListBloc(maintenanceBloc: BlocProvider.of<MaintenanceBloc>(context)),
        ),
      ],
      child: MaterialApp(
        title: 'Ciclo Helper',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.lightGreen
        ),
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        // ignore: missing_return
          builder: (context, state) {
            if (state is Uninitialized) {
              return SplashScreen();
            }
            if (state is Unauthenticated) {
              return LoginPage(userRepository: _userRepository);
            }
            if (state is Authenticated) {
              return HomePage(name: state.displayName);
            }
          }
        ),
      ),
    );
  }
}




