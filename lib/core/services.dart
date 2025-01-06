import 'package:get_storage/get_storage.dart';
import 'package:my_app/model/user.dart';

class AppServices {
  static final box = GetStorage();

  static void saveUserList(List<User> users) {
    box.write(
      'users',
      users.map((user) => user.toJson()).toList(),
    );
  }

  static List<User> getUsersList() {
    final data = box.read<List<dynamic>>('users') ?? [];
    return data
        .map((item) => User.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
