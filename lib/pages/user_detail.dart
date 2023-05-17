import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../model/user.dart';

class UserDetail extends StatelessWidget {
  User user;
  UserDetail({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 18,
              ),
              Text(
                "Back",
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
        ),
        leadingWidth: 100,
        bottom: PreferredSize(
          preferredSize: const Size(
            double.infinity,
            50,
          ),
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(20),
            child: Hero(
              tag: 'title',
              child: Text(
                'Detail',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: 2 * defaultPadding),
        physics: const BouncingScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                leading: Container(
                  height: double.infinity,
                  child: Hero(tag: user.id!, child: const Icon(Icons.person_rounded)),
                ),
                title: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Hero(
                        tag: user.name!,
                        child: Text(
                          user.name!,
                          style: Theme.of(context).textTheme.titleMedium!,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: defaultPadding),
              ListTile(
                leading: Container(
                  height: double.infinity,
                  child: const Icon(Icons.phone_rounded),
                ),
                title: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Hero(
                        tag: user.contact!,
                        child: Text(user.contact!, style: Theme.of(context).textTheme.titleSmall!),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: defaultPadding),
              ListTile(
                leading: Container(
                  height: double.infinity,
                  child: const Icon(Icons.book_rounded),
                ),
                title: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Hero(
                        tag: user.bio!,
                        child: Text(user.bio!, style: Theme.of(context).textTheme.titleSmall!),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 2 * defaultPadding),
            ],
          ),
        ],
      ),
    );
  }
}
