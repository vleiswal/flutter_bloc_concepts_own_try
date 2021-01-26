import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concepts_own_try/logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_concepts_own_try/presentation/screens/home_screen.dart';
import 'package:flutter_bloc_concepts_own_try/presentation/screens/second_screen.dart';
import 'package:flutter_bloc_concepts_own_try/presentation/screens/third_screen.dart';

void main() {
  final CounterState counterState1 = CounterState(counterValue: 1);
  final CounterState counterState2 = CounterState(counterValue: 1);

  print(counterState1 == counterState2);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CounterCubit _counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (context) => BlocProvider.value(
                value: _counterCubit,
                child: HomeScreen(
                  title: 'HomeScreen',
                  color: Colors.blueAccent,
                ),
              ),
          '/second': (context) => BlocProvider.value(
                value: _counterCubit,
                child: SecondScreen(
                  title: 'SecondScreen',
                  color: Colors.redAccent,
                ),
              ),
          '/third': (context) => BlocProvider.value(
                value: _counterCubit,
                child: ThirdScreen(
                  title: 'ThirdScreen',
                  color: Colors.greenAccent,
                ),
              ),
        },
      ),
    );
  }

  @override
  void dispose() {
    _counterCubit.close();
    super.dispose();
  }
}
