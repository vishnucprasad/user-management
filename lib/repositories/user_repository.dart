import 'package:my_app/models/user.dart';
import 'package:my_app/utils/storage_service.dart';

class UserRepository {
  final StorageService _storageService = StorageService();

  void saveUsers(List<User> users) {
    _storageService.saveUsers(users);
  }

  List<User> getUsers() {
    return _storageService.getUsersList();
  }
}
