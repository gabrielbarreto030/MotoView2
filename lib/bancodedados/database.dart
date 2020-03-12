
import 'package:motovibe/bancodedados/dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> CreateDabase() async{
  final String path=join(await getDatabasesPath(),"MotoView.db");
  return openDatabase(path,onCreate: (db,version){
       db.execute(MotoDao.tablesql);
     },version: 1,
     );


}
