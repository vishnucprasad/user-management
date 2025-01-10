import 'package:get_storage/get_storage.dart';
import 'package:my_app/models/user.dart';

class StorageService {
  static final box = GetStorage();

  void saveUsers(List<User> users) {
    box.write(
      'users',
      users.map((user) => user.toJson()).toList(),
    );
  }

  List<User> getUsersList() {
    final data = box.read<List<dynamic>>('users') ?? [];
    return data
        .map((item) => User.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
