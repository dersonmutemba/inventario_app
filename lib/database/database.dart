import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:inventario/models/acquisition.dart';
import 'package:inventario/models/product.dart';
import 'package:inventario/models/removal.dart';
import 'package:inventario/models/storage.dart';
import 'package:inventario/models/usage.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Database {
  static const String databaseName = 'inventario.db';
  static const int databaseVersion = 1;

  static const Map<String, String> product = Product.product;

  static const Map<String, String> storage = Storage.storage;

  static const Map<String, String> acquisition = Acquisition.acquisition;

  static const Map<String, String> usage = Usage.usage;

  static const Map<String, String> removal = Removal.removal;

  Future<dynamic> initialize() async {

    WidgetsFlutterBinding.ensureInitialized();

    return openDatabase(
      join(await getDatabasesPath(), databaseName),
      onCreate: ((db, version) {
        return db.execute('CREATE TABLE ${product['table']} ('
          '${product['key']} INTEGER PRIMARY KEY,'
          ' ${product['field1']} TEXT NOT NULL,'
          ' ${product['field2']} TEXT,'
          ' ${product['field3']} REAL NOT NULL,'
          ' ${product['field4']} REAL,'
          ' ${product['field5']} TEXT,'
          ' ${product['field6']} REAL,'
          ' ${product['field7']} TEXT,'
          ' ${product['field8']} TEXT'
        ');'
        'CREATE TABLE ${storage['table']} ('
          '${storage['key']} INTEGER PRIMARY KEY,'
          ' ${storage['field1']} TEXT NOT NULL,'
          ' ${storage['field2']} TEXT'
        ');'
        'CREATE TABLE ${acquisition['table']} ('
          '${acquisition['key']} INTEGER PRIMARY KEY,'
          ' ${acquisition['field1']} INTEGER NOT NULL,'
          ' ${acquisition['field2']} INTEGER NULL,'
          ' ${acquisition['field3']} TEXT NOT NULL,'
          ' ${acquisition['field4']} TEXT,'
          ' ${acquisition['field5']} INTEGER NOT NULL,'
          ' ${acquisition['field6']} DOUBLE NOT NULL,'
          'FOREIGN KEY(${acquisition['field1']} REFERENCES ${product['table']}(${product['key']}),'
          'FOREIGN KEY(${acquisition['field2']} REFERENCES ${storage['table']}(${storage['key']})'
        ');'
        'CREATE TABLE ${usage['table']} ('
          '${usage['key']} INTEGER PRIMARY KEY,'
          ' ${usage['field1']} INTEGER NOT NULL,'
          ' ${usage['field2']} TEXT NOT NULL,'
          ' ${usage['field3']} INTEGER NOT NULL,'
          'FOREIGN KEY(${usage['field1']} REFERENCES ${product['table']}(${product['key']}),'
        ');'
        'CREATE TABLE ${removal['table']} ('
          '${removal['key']} INTEGER PRIMARY KEY,'
          ' ${removal['field1']} INTEGER NOT NULL,'
          ' ${removal['field2']} TEXT NOT NULL,'
          ' ${removal['field3']} INTEGER NOT NULL,'
          'FOREIGN KEY(${removal['field1']} REFERENCES ${product['table']}(${product['key']}),'
        ');');
      }),
      version: databaseVersion
    );
  }

  Future<void> insertProduct(Product product) async {
    final db = await initialize();
    await db.insert(
      Database.product['table'],
      product.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Product>> products() async {
    final db = await initialize();
    final List<Map<String, dynamic>> products = await db.query(product['table']);
    return List.generate(products.length, (i) {
      return Product(
        id: products[i][product['key']],
        name: products[i][product['field1']],
        price: products[i][product['field3']],
        category: products[i][product['field2']],
        mass: {products[i][product['field4']] : products[i][product['field5']]},
        volume: {products[i][product['field6']] : products[i][product['field7']]},
        image: products[i][product['field8']],
      );
    });
  }

  Future<void> updateProduct(Product product) async {
    final db = await initialize();
    await db.update(
      Database.product['table'],
      product.toMap(),
      where: '${Database.product['key']} = ?',
      whereArgs: product.id,
    );
  }

  Future<void> deleteProduct(Product product) async {
    final db = await initialize();
    await db.delete(
      Database.product['table'],
      where: '${Database.product['key']} = ?',
      whereArgs: product.id,
    );
  }

  Future<void> insertStorage(Storage storage) async {
    final db = await initialize();
    await db.insert(
      Database.storage['table'],
      storage.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Storage>> storages() async {
    final db = await initialize();
    final List<Map<String, dynamic>> storages = await db.query(storage['table']);
    return List.generate(storages.length, (i) {
      return Storage(
        id: storages[i][storage['key']],
        name: storages[i][storage['field1']],
        location: storages[i][storage['field2']],
      );
    });
  }

  Future<void> updateStorage(Storage storage) async {
    final db = await initialize();
    await db.update(
      Database.storage['table'],
      storage.toMap(),
      where: '${Database.storage['key']} = ?',
      whereArgs: storage.id,
    );
  }

  Future<void> deleteStorage(Storage storage) async {
    final db = await initialize();
    await db.delete(
      Database.storage['table'],
      where: '${Database.storage['key']} = ?',
      whereArgs: storage.id,
    );
  }

  Future<void> insertAcquisition(Acquisition acquisition) async {
    final db = await initialize();
    await db.insert(
      Database.acquisition['table'],
      acquisition.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Acquisition>> acquisitions() async {
    final db = await initialize();
    final List<Map<String, dynamic>> acquisitions = await db.query(acquisition['table']);
    return List.generate(acquisitions.length, (i) {
      return Acquisition(
        id: acquisitions[i][acquisition['key']],
        product: acquisitions[i][acquisition['field1']],
        storage: acquisitions[i][acquisition['field2']],
        day: acquisitions[i][acquisition['field3']],
        bestBefore: acquisitions[i][acquisition['field4']],
        quantity: acquisitions[i][acquisition['field5']],
        price: acquisitions[i][acquisition['field6']],
      );
    });
  }

  Future<void> updateAcquisition(Acquisition acquisition) async {
    final db = await initialize();
    await db.update(
      Database.acquisition['table'],
      acquisition.toMap(),
      where: '${Database.acquisition['key']} = ?',
      whereArgs: acquisition.id,
    );
  }

  Future<void> deleteAcquisition(Acquisition acquisition) async {
    final db = await initialize();
    await db.delete(
      Database.acquisition['table'],
      where: '${Database.acquisition['key']} = ?',
      whereArgs: acquisition.id,
    );
  }

  Future<void> insertUsage(Usage usage) async {
    final db = await initialize();
    await db.insert(
      Database.usage['table'],
      usage.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Usage>> usages() async {
    final db = await initialize();
    final List<Map<String, dynamic>> usages = await db.query(usage['table']);
    return List.generate(usages.length, (i) {
      return Usage(
        id: usages[i][usage['key']],
        product: usages[i][usage['field1']],
        day: usages[i][usage['field2']],
        quantity: usages[i][usage['field3']],
      );
    });
  }

  Future<void> updateUsage(Usage usage) async {
    final db = await initialize();
    await db.update(
      Database.usage['table'],
      usage.toMap(),
      where: '${Database.usage['key']} = ?',
      whereArgs: usage.id,
    );
  }

  Future<void> deleteUsage(Usage usage) async {
    final db = await initialize();
    await db.delete(
      Database.usage['table'],
      where: '${Database.usage['key']} = ?',
      whereArgs: usage.id,
    );
  }

  Future<void> insertRemoval(Removal removal) async {
    final db = await initialize();
    await db.insert(
      Database.removal['table'],
      removal.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Removal>> removals() async {
    final db = await initialize();
    final List<Map<String, dynamic>> removals = await db.query(removal['table']);
    return List.generate(removals.length, (i) {
      return Removal(
        id: removals[i][removal['key']],
        product: removals[i][removal['field1']],
        day: removals[i][removal['field2']],
        quantity: removals[i][removal['field3']],
      );
    });
  }

  Future<void> updateRemoval(Removal removal) async {
    final db = await initialize();
    await db.update(
      Database.removal['table'],
      removal.toMap(),
      where: '${Database.removal['key']} = ?',
      whereArgs: removal.id,
    );
  }

  Future<void> deleteRemoval(Removal removal) async {
    final db = await initialize();
    await db.delete(
      Database.removal['table'],
      where: '${Database.removal['key']} = ?',
      whereArgs: removal.id,
    );
  }

}