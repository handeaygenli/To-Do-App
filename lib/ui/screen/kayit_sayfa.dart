import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/ui/cubit/kayit_sayfa_cubit.dart';


class KayitSayfa extends StatefulWidget {
  const KayitSayfa({Key? key}) : super(key: key);

  @override
  State<KayitSayfa> createState() => _YapilacakIsKayitState();
}

class _YapilacakIsKayitState extends State<KayitSayfa> {
  var tfIsKontrol = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yapılacak İş Kayıt"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tfIsKontrol,
                decoration: InputDecoration(hintText: "Yapılacak İş"),
              ),
              ElevatedButton(
                onPressed: () { context.read<KayitCubit>().kayit(tfIsKontrol.text); },
                child: const Text("KAYDET"),style: ElevatedButton.styleFrom(primary: Colors.deepOrange),),
            ],
          ),
        ),
      ),
    );
  }
}