import 'package:project2/Item.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';

class item_DataBase{
  static int id = 0;
  static final item_DataBase instance = item_DataBase._init();

  static Database? _database;

  item_DataBase._init();

  Future<Database> get database async{

    if(_database != null) return _database!;

    _database = await _initDB('items.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {

    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async{
    const intType = 'INTEGER';
    const textType = 'TEXT';
    const idType = 'INTEGER';

    await db.execute("CREATE TABLE $tableItems (${ItemFields.id} $idType, ${ItemFields.size} $textType, ${ItemFields.gender} $textType, ${ItemFields.garment} $textType, ${ItemFields.price} $intType,${ItemFields.shop} $textType)");
    id += 1;
  }

  Future<Item> create(Item item) async{
    final db = await instance.database;
    
    final json = item.toJson();
    final column =
        '${ItemFields.id}, ${ItemFields.size}, ${ItemFields.gender}, ${ItemFields.garment}, ${ItemFields.price}, ${ItemFields.shop}';

    final values =
        "${json[ItemFields.id]}, '${json[ItemFields.size]}', '${json[ItemFields.gender]}', '${json[ItemFields.garment]}', ${json[ItemFields.price]}, '${json[ItemFields.shop]}'";

    final id = await db.rawInsert('INSERT INTO $tableItems ($column) VALUES ($values)');

    //final id = await db.insert(tableItems, item.toJson());

    return item.copy(id: id);
  }

  Future<List<Item>> readAllItems(String size, String gender, String garment, int rate) async {
    final db = await instance.database;

    final orderBy = '${ItemFields.price} ASC';

    final where_Gender = "${ItemFields.gender} = '$gender'";
    final where_Size = size == "Any Size" ? "" : "AND ${ItemFields.size} = '$size'";
    final where_Garment = garment == "Any Product"? "" : "AND ${ItemFields.garment} = '$garment'";
    final where_Price = rate == -1 ? "" : "AND ${ItemFields.price} <= $rate";


    // final result =
    //     await db.rawQuery('SELECT * FROM $tableItems ORDER BY $orderBy');

    final result = await
    db.rawQuery('SELECT DISTINCT(shop) FROM $tableItems WHERE $where_Gender $where_Size $where_Garment $where_Price ORDER BY $orderBy');

    return result.map((json) => Item.fromJson(json)).toList();
  }

  Future delete() async{
    final db = await instance.database;
    await db.rawQuery('DELETE FROM $tableItems');
  }

}

