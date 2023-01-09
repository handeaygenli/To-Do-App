import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/ui/cubit/anasayfa_cubit.dart';
import 'package:todoapp/ui/cubit/detay_sayfa_cubit.dart';
import 'package:todoapp/ui/cubit/kayit_sayfa_cubit.dart';
import 'package:todoapp/ui/screen/anasayfa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => KayitCubit()),
        BlocProvider(create: (context) => DetayCubit()),
        BlocProvider(create: (context) => AnasayfaCubit()),
      ],
      child: MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const Anasayfa()
      ),
    );
  }
}

