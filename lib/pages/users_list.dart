import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../controllers/user_controller.dart';
import '../model/user.dart';
import 'new_user.dart';

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
            child: const Text(
              'Users',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
      body: GetBuilder(
        init: UserListController(),
        builder: (controller) => ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding,
            vertical: 2 * defaultPadding,
          ),
          itemCount: controller.users.length,
          itemBuilder: (context, index) {
            User user = controller.users[index];
            return Container(
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
                        Text(
                          "${user.name}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: defaultPadding - 10),
                        Text(
                          "${user.contact}",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                        ),
                        const SizedBox(height: defaultPadding - 6),
                        Text(
                          "${user.bio}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(),
                        ),
                        const SizedBox(height: defaultPadding - 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: const Text('Edit'),
                            ),
                            const SizedBox(width: defaultPadding - 10),
                            TextButton(
                              onPressed: () {},
                              child: const Text('Delete'),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
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
