import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/data/entity/yapilacaklar.dart';
import 'package:todoapp/data/repo/yapilacaklardao_repo.dart';

class AnasayfaCubit extends Cubit<List<Yapilacaklar>>{

  AnasayfaCubit():super(<Yapilacaklar>[]);

  var yrepo = YapilacaklarDaoRepo();//repoya erisim

  Future<void> yapilacaklariYukle() async{
    var liste =await yrepo.tumYapilacaklariAl();
    emit(liste);
  }

  Future<void> ara(String aramaKelimesi)async{
    var liste = await yrepo.yapilacakAra(aramaKelimesi);
    emit(liste);
  }

  Future<void> sil(int yapilacak_id) async{
    await yrepo.yapilacakSil(yapilacak_id);
    await yapilacaklariYukle();
  }
}