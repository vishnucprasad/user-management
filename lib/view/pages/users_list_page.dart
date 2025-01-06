import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_app/core/services.dart';
import 'package:my_app/model/user.dart';
import 'package:my_app/view/pages/create_user.dart';

class UsersListPage extends HookWidget {
  const UsersListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final savedUsers = AppServices.getUsersList();
    final users = useState<List<User>>(savedUsers);

    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: ListView.builder(
        itemCount: users.value.length,
        itemBuilder: (context, index) {
          final user = users.value[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${user.firstName} ${user.lastName}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('Email: ${user.email}'),
                  Text('Phone: ${user.phoneNumber}'),
                  Text('Location: ${user.location}'),
                  Text('Age: ${user.age}'),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => CreateUserPage(
                onAddUser: (ValueNotifier<User> user) {
                  users.value = [...users.value, user.value];
                  AppServices.saveUserList(users.value);
                },
              ),
            ),
          );
        },
        label: Text('Create User'),
      ),
    );
  }
}
