import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_app/model/user.dart';

class CreateUserPage extends HookWidget {
  final void Function(ValueNotifier<User>) onAddUser;

  const CreateUserPage({
    super.key,
    required this.onAddUser,
  });

  @override
  Widget build(BuildContext context) {
    final user = useState(User.initial());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'First Name',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  onChanged: (firstName) {
                    user.value = user.value.copyWith(firstName: firstName);
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter your first name',
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Last Name',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  onChanged: (lastname) {
                    user.value = user.value.copyWith(lastName: lastname);
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter your last name',
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Email',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  onChanged: (email) {
                    user.value = user.value.copyWith(email: email);
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter your email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Phone Number',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  onChanged: (phoneNumber) {
                    user.value = user.value.copyWith(phoneNumber: phoneNumber);
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter your phone number',
                  ),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Location',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  onChanged: (locateion) {
                    user.value = user.value.copyWith(location: locateion);
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter your location',
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Age',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  onChanged: (age) {
                    user.value = user.value.copyWith(age: int.parse(age));
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter your age',
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 32),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      onAddUser(user);
                      Navigator.pop(context);
                    },
                    child: const Text('Sign Up'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
