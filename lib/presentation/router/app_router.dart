import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concepts_own_try/presentation/screens/home_screen.dart';
import 'package:flutter_bloc_concepts_own_try/presentation/screens/second_screen.dart';
import 'package:flutter_bloc_concepts_own_try/presentation/screens/third_screen.dart';
import 'package:flutter_bloc_concepts_own_try/logic/cubit/counter_cubit.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();

  Route onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: HomeScreen(
              title: 'Home Screen',
              color: Colors.blueAccent,
            ),
          ),
        );
        break;

      case '/second':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _counterCubit,
                  child: SecondScreen(
                    title: 'Home Screen',
                    color: Colors.redAccent,
                  ),
                ));
        break;

      case '/third':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _counterCubit,
                  child: ThirdScreen(
                    title: 'Home Screen',
                    color: Colors.greenAccent,
                  ),
                ));
        break;

      default:
        return null;
    }
  }

  void dispose() {
    _counterCubit.close();
  }
}
