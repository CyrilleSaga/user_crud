import 'package:get/get.dart';

import '../model/user.dart';
import '../services/user_service.dart';

class UserListController extends GetxController {
  UserListController() {
    _userService = UserService();
  }

  List<User> users = [];

  late UserService _userService;

  @override
  void onInit() async {
    super.onInit();
    await getAllUsers();
  }

  Future<void> getAllUsers() async {
    users = await _userService.readAllUsers();
    update();
  }
}

class HandleUserController extends GetxController {
  final UserService _userService = UserService();

  Future<void> createUser(User user) async {
    await Future.delayed(const Duration(seconds: 2));
    await _userService.saveUser(user);
    update();
  }

  Future<void> updateUser(User user) async {
    await Future.delayed(const Duration(seconds: 2));
    await _userService.updateUser(user);
    update();
  }

  Future<void> deleteUser(User user) async {
    await _userService.deleteUser(user.id!);
    update();
  }
}
