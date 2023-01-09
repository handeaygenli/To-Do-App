import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/data/repo/yapilacaklardao_repo.dart';

class DetayCubit extends Cubit <void> {

  DetayCubit():super(0);

  var yrepo= YapilacaklarDaoRepo();

  Future<void> guncelle(String yapilacak_is, int yapilacak_id) async{
    await yrepo.yapilacakGuncelle(yapilacak_is,yapilacak_id);
  }
}