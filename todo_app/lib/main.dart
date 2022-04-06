import 'package:flutter/material.dart';
import 'src/app.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('todos');
  await Hive.openBox('accounts');
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}
