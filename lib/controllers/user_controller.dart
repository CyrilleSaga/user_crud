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
