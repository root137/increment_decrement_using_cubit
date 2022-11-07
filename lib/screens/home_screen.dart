import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_bloc_cubit/cubit/counter_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        elevation: 10,
        centerTitle: true,
        title: const Text("Counter Using Cubit"),
      ),
      body: Container(
        height: 400,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(
          top: 300,
          left: 10,
        ),
        child: Column(
          children: [
            Text(
              "You have pressed this button",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<CounterCubit, int>(builder: (context, state) {
              return Text(
                "$state times.",
                style: TextStyle(fontSize: 22),
              );
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: const Icon(
          Icons.plus_one_outlined,
          size: 40,
        ),
        onPressed: () {
          context.read<CounterCubit>().increment();
        },
      ),
    );
  }
}
