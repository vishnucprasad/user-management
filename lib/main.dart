import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_app/view/pages/users_list_page.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My APP',
      debugShowCheckedModeBanner: false,
      home: UsersListPage(),
    );
  }
}
