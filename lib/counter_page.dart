import 'package:bloc_pattern_counter/counter_bloc.dart';
import 'package:bloc_pattern_counter/counter_event.dart';
import 'package:flutter/material.dart';

class CounterPage extends StatelessWidget {
  CounterPage({super.key});

  final CounterBloc _counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Pattern'),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () =>
                  _counterBloc.counterEventSink.add(DecrementEvent()),
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
            const SizedBox(width: 20),
            StreamBuilder<int>(
                initialData: 0,
                stream: _counterBloc.counter,
                builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                  return Text(snapshot.data.toString());
                }),
            const SizedBox(width: 20),
            FloatingActionButton(
              onPressed: () =>
                  _counterBloc.counterEventSink.add(IncrementEvent()),
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
