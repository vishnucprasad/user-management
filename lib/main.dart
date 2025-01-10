import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_app/viewmodels/user_viewmodel.dart';
import 'package:my_app/views/users_list_page.dart';
import 'package:provider/provider.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserViewmodel()..loadUsers(),
      child: MaterialApp(
        title: 'My APP',
        debugShowCheckedModeBanner: false,
        home: UsersListPage(),
      ),
    );
  }
}
