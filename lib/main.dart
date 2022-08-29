import 'package:bloc_testing/cubit/counter_cubit.dart';
import 'package:bloc_testing/shared/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const TestBlocCounter());
}

class TestBlocCounter extends StatelessWidget {
  const TestBlocCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => CounterCubit(),
        child: BlocConsumer<CounterCubit, CounterStates>(
          listener: (context, state) {
            if (state is CounterMinusState) {
              print('Minus State ${state.counter}');
            }
            if (state is CounterPlusState) {
              print('Plus State ${state.counter}');
            }
          },
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Bloc Test Counter'),
              ),
              body: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        CounterCubit.get(context).minus();
                      },
                      child: const Text(
                        'Minus',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Text(
                        '${CounterCubit.get(context).counter}',
                        style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        CounterCubit.get(context).plus();
                      },
                      child: const Text(
                        'Plus',
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
