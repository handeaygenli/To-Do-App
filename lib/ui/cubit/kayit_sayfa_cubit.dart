import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/data/repo/yapilacaklardao_repo.dart';

class KayitCubit extends Cubit<void> {

  KayitCubit():super(0);

  var yrepo= YapilacaklarDaoRepo();

  Future<void> kayit(String yapilacak_is) async{
    await yrepo.yapilacaklarKayit(yapilacak_is);
  }
}