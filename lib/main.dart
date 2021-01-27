import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_bloc_concepts_own_try/logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_concepts_own_try/logic/cubit/internet_cubit.dart';
import 'package:flutter_bloc_concepts_own_try/presentation/router/app_router.dart';

void main() {
  // final CounterState counterState1 = CounterState(counterValue: 1);
  // final CounterState counterState2 = CounterState(counterValue: 1);

  // print(counterState1 == counterState2);

  runApp(
    MyApp(
      appRouter: AppRouter(),
      connectivity: Connectivity(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final Connectivity connectivity;

  const MyApp({
    Key key,
    @required this.appRouter,
    @required this.connectivity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity: connectivity),
        ),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(
            internetCubit: context.read<InternetCubit>(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: appRouter.onGeneratedRoute,
      ),
    );
  }
}
