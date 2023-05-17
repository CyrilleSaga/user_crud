import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../controllers/user_controller.dart';
import '../model/user.dart';
import 'new_user.dart';
import 'update_user.dart';
import 'user_detail.dart';

class UsersList extends StatelessWidget {
  const UsersList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        bottom: PreferredSize(
          preferredSize: const Size(
            double.infinity,
            40,
          ),
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(20),
            child: const Hero(
              tag: 'title',
              child: Text(
                'Users',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ),
      body: GetBuilder(
        init: UserListController(),
        builder: (controller) => ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding,
            vertical: 2 * defaultPadding,
          ),
          itemCount: controller.users.length,
          itemBuilder: (context, index) {
            User user = controller.users[index];
            return InkWell(
              onTap: () => Get.to(() => UserDetail(user: user)),
              child: Container(
                padding: const EdgeInsets.all(defaultPadding),
                margin: const EdgeInsets.only(bottom: defaultPadding * .3),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(defaultPadding),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: const [
                          Icon(
                            Icons.person_rounded,
                            size: 50,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Hero(
                            tag: user.name!,
                            child: Text(
                              "${user.name}",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.3,
                              ),
                            ),
                          ),
                          const SizedBox(height: defaultPadding - 10),
                          Hero(
                            tag: user.contact!,
                            child: Text(
                              "${user.contact}",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ),
                          const SizedBox(height: defaultPadding - 6),
                          Hero(
                            tag: user.bio!,
                            child: Text(
                              "${user.bio}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(height: defaultPadding - 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Get.to(() => UpdateUser(user: user));
                                },
                                child: const Text('Edit'),
                              ),
                              const SizedBox(width: defaultPadding - 10),
                              TextButton(
                                onPressed: () {
                                  Get.dialog(
                                    AlertDialog(
                                      title: const Text('Delete'),
                                      content: const Text('Do you want to delete this user ?'),
                                      actions: [
                                        OutlinedButton(
                                          style: OutlinedButton.styleFrom(
                                            backgroundColor: Theme.of(context).primaryColor,
                                            foregroundColor: Colors.white,
                                            side: BorderSide(color: Theme.of(context).primaryColor),
                                          ),
                                          onPressed: () => Get.back(),
                                          child: const Text('Cancel'),
                                        ),
                                        OutlinedButton(
                                          style: OutlinedButton.styleFrom(
                                            backgroundColor: Theme.of(context).primaryColor,
                                            foregroundColor: Colors.white,
                                            side: BorderSide(color: Theme.of(context).primaryColor),
                                          ),
                                          onPressed: () async {
                                            Get.put(HandleUserController());
                                            await Get.find<HandleUserController>().deleteUser(user);
                                            Get.back();
                                            await controller.getAllUsers();
                                          },
                                          child: const Text('Delete'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                child: const Text('Delete'),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 10,
        onPressed: () {
          Get.to(() => NewUser());
        },
        child: const Icon(
          Icons.person_add_alt_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
