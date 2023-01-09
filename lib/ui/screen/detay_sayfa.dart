import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/ui/cubit/detay_sayfa_cubit.dart';
import 'package:todoapp/data/entity/yapilacaklar.dart';

class DetaySayfa extends StatefulWidget {
  Yapilacaklar yapilacak;

  DetaySayfa({required this.yapilacak});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  var tfIsKontrol=TextEditingController();


  @override
  void initState() {
    super.initState();
    var yapilacak=widget.yapilacak;
    tfIsKontrol.text=yapilacak.yapilacak_is;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yapılacak İş Detay"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfIsKontrol,decoration: InputDecoration(hintText: tfIsKontrol.text),),
              ElevatedButton(onPressed: (){
                context.read<DetayCubit>().guncelle(tfIsKontrol.text,widget.yapilacak.yapilacak_id);
              }, child: const Text("GÜNCELLE"),style: ElevatedButton.styleFrom(primary: Colors.deepOrange),),
            ],
          ),
        ),
      ),
    );
  }
}