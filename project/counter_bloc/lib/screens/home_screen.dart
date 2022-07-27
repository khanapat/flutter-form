import 'package:counter_bloc/bloc/counter_bloc.dart';
import 'package:counter_bloc/screens/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter BLoC')),
      body: Container(
        color: Colors.amber,
        padding: EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // update ui
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) => Text(
                state.value.toString(),
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            // Text(
            //   '0',
            //   style: Theme.of(context).textTheme.headline1,
            // ),
            // ทำหลังบ้าน ดัก event
            // BlocListener(listener: listener)
            // ทั้ง 2 อย่าง
            // BlocConsumer(builder: builder, listener: listener)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () => context.read<CounterBloc>().add(CounterEvent.decrement),
                  child: Icon(Icons.remove),
                ),
                FloatingActionButton(
                  onPressed: () => context.read<CounterBloc>().add(CounterEvent.increment),
                  child: Icon(Icons.add),
                )
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SecondScreen(),
              )),
              child: Text('Next'),
            )
          ],
        ),
      ),
    );
  }
}
