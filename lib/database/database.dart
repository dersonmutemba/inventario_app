import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:inventario/models/product.dart';
import 'package:inventario/models/storage.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Database {
  static const String databaseName = 'inventario.db';
  static const int databaseVersion = 1;

  static const Map<String, String> product = Product.product;

  static const Map<String, String> storage = Storage.storage;

  static const Map<String, String> acquisition = {
    'table' : 'acquision',
    'key' : 'id',
    'field1' : 'product',
    'field2' : 'storage',
    'field3' : 'day',
    'field4' : 'bestbefore',
    'field5' : 'quantity',
    'field6' : 'price',
  };

  static const Map<String, String> usage = {
    'table' : 'usage',
    'key' : 'id',
    'field1' : 'product',
    'field2' : 'day',
    'field3' : 'quantity',
  };

  static const Map<String, String> removal = {
    'table' : 'removal',
    'key' : 'id',
    'field1' : 'product',
    'field2' : 'day',
    'field3' : 'quantity',
  };

  late Future<dynamic> database;

  void initialize() async {

    WidgetsFlutterBinding.ensureInitialized();

    database = openDatabase(
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
          ' ${product['field7']} TEXT'
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

}