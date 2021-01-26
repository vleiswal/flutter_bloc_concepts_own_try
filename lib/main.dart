import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_bloc_concepts_own_try/logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_concepts_own_try/presentation/router/app_router.dart';

void main() {
  final CounterState counterState1 = CounterState(counterValue: 1);
  final CounterState counterState2 = CounterState(counterValue: 1);

  print(counterState1 == counterState2);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: _appRouter.onGeneratedRoute,
      ),
    );
  }
}
