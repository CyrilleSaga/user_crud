import 'package:users/repositories/user_repository.dart';

import '../model/user.dart';

class UserService {
  late UserRepository _repository;

  UserService() {
    _repository = UserRepository();
  }

  //Save User
  Future<int> saveUser(User user) async {
    return (await _repository.insertData(user.toMap()))!;
  }

  //Read All Users
  Future<List<User>> readAllUsers() async {
    var data = await _repository.readData();
    return data!.map((e) => User.fromMap(e)).toList();
  }

  //Edit User
  Future<int> updateUser(User user) async {
    return (await _repository.updateData(user.toMap()))!;
  }

  Future<int> deleteUser(int userId) async {
    return (await _repository.deleteDataById(userId))!;
  }
}
