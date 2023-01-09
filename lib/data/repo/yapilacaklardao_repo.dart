import 'package:todoapp/data/entity/yapilacaklar.dart';
import 'package:todoapp/data/sqlite/veritabani.dart';

class YapilacaklarDaoRepo {

  Future<void> yapilacaklarKayit(String yapilacak_is) async {
    var db = await Veritabani.veritabaniErisim();
    var bilgi = Map<String, dynamic>();
    bilgi["yapilacak_is"] = yapilacak_is;
    await db.insert("yapilacaklar", bilgi);
  }

  Future<List<Yapilacaklar>> tumYapilacaklariAl() async {
    var db =
    await Veritabani.veritabaniErisim(); //veritabanına erisim
    List<Map<String, dynamic>> maps =
    await db.rawQuery("SELECT * FROM yapilacaklar");

    return List.generate(maps.length, (index) {
      var satir = maps[index];
      return Yapilacaklar(
          yapilacak_id: satir["yapilacak_id"],
          yapilacak_is: satir["yapilacak_is"]);
    });
  }

  Future<List<Yapilacaklar>> yapilacakAra(String aramaKelimesi) async {
    var db = await Veritabani.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT * FROM yapilacaklar WHERE yapilacak_is like '%$aramaKelimesi%'");

    return List.generate(maps.length, (index) {
      var satir = maps[index];
      return Yapilacaklar(
          yapilacak_id: satir["yapilacak_id"],
          yapilacak_is: satir["yapilacak_is"]);
    });
  }

  Future<void> yapilacakSil(int yapilacak_id) async {
    var db = await Veritabani.veritabaniErisim();
    await db.delete("yapilacaklar",
        where: "yapilacak_id = ?", whereArgs: [yapilacak_id]);
  }



  Future<void> yapilacakGuncelle(String yapilacak_is, int yapilacak_id) async {
    var db = await Veritabani.veritabaniErisim();
    var bilgi = Map<String, dynamic>();
    bilgi["yapilacak_is"] = yapilacak_is;
    await db.update("yapilacaklar", bilgi,
        where: "yapilacak_id = ?", whereArgs: [yapilacak_id]);
  }
}