import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../controllers/user_controller.dart';
import '../model/user.dart';

class UpdateUser extends StatelessWidget {
  User user;

  UpdateUser({
    super.key,
    required this.user,
  }) {
    _nameController.text = user.name!;
    _contactController.text = user.contact!;
    _bioController.text = user.bio!;
  }

  final _formKey = GlobalKey<FormState>();
  final _unfocusNode = FocusNode();

  final _nameController = TextEditingController();
  final _contactController = TextEditingController();
  final _bioController = TextEditingController();

  RxBool loading = false.obs;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
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
              child: const Text(
                'Update user',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
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
            Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTile(
                    leading: Container(
                      height: double.infinity,
                      child: const Icon(Icons.person_rounded),
                    ),
                    title: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextFormField(
                            obscureText: false,
                            controller: _nameController,
                            style: const TextStyle(fontSize: 18),
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if (value == null || value.isEmpty) return "The name is required";
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Full name',
                              hintText: 'Enter the name of user...',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.red.withOpacity(0.5),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.red.withOpacity(0.5),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              filled: true,
                              contentPadding: const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
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
                          child: TextFormField(
                            obscureText: false,
                            controller: _contactController,
                            style: const TextStyle(fontSize: 18),
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value == null || value.isEmpty) return "The contact is required";
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Contact',
                              hintText: 'Enter the contact of user...',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.red.withOpacity(0.5),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.red.withOpacity(0.5),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              filled: true,
                              contentPadding: const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
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
                      child: const Icon(Icons.book_rounded),
                    ),
                    title: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextFormField(
                            obscureText: false,
                            controller: _bioController,
                            style: const TextStyle(fontSize: 18),
                            minLines: 5,
                            maxLength: 250,
                            maxLines: 8,
                            keyboardType: TextInputType.multiline,
                            validator: (value) {
                              if (value == null || value.isEmpty) return "The bio is required";
                              if (value.length > 250) return "The bio must be least than 250 charateres";
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Bio',
                              hintText: 'Enter the bio of user...',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.red.withOpacity(0.5),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.red.withOpacity(0.5),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              filled: true,
                              contentPadding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 2 * defaultPadding),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () async {
                        Get.put(HandleUserController());
                        if (_formKey.currentState!.validate()) {
                          loading.value = true;
                          User updatedUser = user.copyWith(
                            name: _nameController.text,
                            contact: _contactController.text,
                            bio: _bioController.text,
                          );
                          await Get.find<HandleUserController>().updateUser(updatedUser);
                          await Get.find<UserListController>().getAllUsers();
                          _nameController.text = '';
                          _contactController.text = '';
                          _bioController.text = '';
                          loading.value = false;
                          Get.back();
                          Get.snackbar('Success', 'the user has been updated successfully.');
                        }
                      },
                      icon: Obx(() {
                        return !loading.value
                            ? const Icon(
                                Icons.save_rounded,
                                size: 20,
                              )
                            : const SizedBox.shrink();
                      }),
                      label: Obx(() {
                        return !loading.value
                            ? const Text('Save')
                            : const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              );
                      }),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
