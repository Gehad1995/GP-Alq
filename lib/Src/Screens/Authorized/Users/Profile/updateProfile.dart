import 'package:alqgp/Src/Models/user_model.dart';
import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:alqgp/Src/Utils/Consts/image_paths.dart';
import 'package:alqgp/Src/Utils/Consts/text.dart';
import 'package:alqgp/Src/Widgets/backButton.dart';
import 'package:alqgp/Src/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class updateProfile extends StatelessWidget {
  const updateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    final formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              backButton(),
              Container(
                margin: const EdgeInsets.only(top: tDefaultSpacing),
                padding: const EdgeInsets.all(tDefaultScreenPadding),
                child: FutureBuilder(
                  future: controller.getUserData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        UserModel userData = snapshot.data as UserModel;

                        //Controllers
                        final email =
                            TextEditingController(text: userData.email);
                        final password = TextEditingController();
                        final fullName =
                            TextEditingController(text: userData.fullName);
                        final phoneNo =
                            TextEditingController(text: userData.phoneNo);

                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () => Get.to(() => updateProfile()),
                              // image & icon
                              child: Stack(
                                children: [
                                  SizedBox(
                                    width: 120,
                                    height: 120,
                                    child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: const Image(
                                            image: AssetImage(tLogo))),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      //the back btn u smart asss ahahahahaha (???????????!)
                                      width: 35,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: tPrimaryColor,
                                      ),
                                      child: const Icon(Icons.camera_enhance,
                                          size: 20.0, color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 30), // delete from here
                            const Divider(), // & replase it with const SizedBox(height: 50),
                            const SizedBox(height: 10), //to here

                            // update form
                            Form(
                              key: formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    validator: (value) {
                                      RegExp regex =
                                          new RegExp(r'^[a-z A-Z,.\-]+$');
                                      if (value!.isEmpty) {
                                        return ("Name cannot be Empty");
                                      }
                                      if (!regex.hasMatch(value)) {
                                        return ("Enter a valid name");
                                      }
                                      return null;
                                    },
                                    controller: fullName,
                                    decoration: const InputDecoration(
                                        label: Text(tFullName),
                                        prefixIcon:
                                            Icon(Icons.person_outline_rounded)),
                                  ),
                                  const SizedBox(height: tFormHeight - 20),
                                  TextFormField(
                                    controller: email,
                                    decoration: const InputDecoration(
                                      label: Text(tEmail),
                                      prefixIcon: Icon(Icons.email_outlined),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return ("Please Enter Your Email");
                                      }
                                      // reg expression for email validation
                                      if (!RegExp(
                                              "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                          .hasMatch(value)) {
                                        return ("Please Enter a valid email");
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: tFormHeight - 20),
                                  TextFormField(
                                    validator: (value) {
                                      RegExp regex =
                                          new RegExp(r'^(?:[+0]9)[0-9]{10,}$');
                                      if (value!.isEmpty) {
                                        return ("Please enter your phone number ");
                                      }
                                      if (!regex.hasMatch(value)) {
                                        return ("Please enter a valid phone number (+966 000000000)");
                                      }
                                    },
                                    controller: phoneNo,
                                    decoration: const InputDecoration(
                                        label: Text(tPhoneNo),
                                        prefixIcon: Icon(Icons.phone)),
                                  ),
                                  const SizedBox(height: tFormHeight - 20),
                                  Obx(
                                    () => TextFormField(
                                      validator: (value) {
                                        RegExp regex = new RegExp(r'^.{6,}$');
                                        if (value!.isEmpty) {
                                          return ("Please enter your password ");
                                        }
                                        if (!regex.hasMatch(value)) {
                                          return ("Please enter a valid Password (Min. 6 Character)");
                                        }
                                      },
                                      obscureText: controller.notshowpass.value,
                                      controller: password,
                                      decoration: InputDecoration(
                                        label: Text(tPassword),
                                        prefixIcon: Icon(Icons.fingerprint),
                                        suffixIcon: IconButton(
                                          onPressed: (() {
                                            controller.changeShow();
                                          }),
                                          icon: controller.notshowpass.value
                                              ? Icon(Icons.remove_red_eye_sharp)
                                              : Icon(Icons
                                                  .remove_red_eye_outlined),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: tFormHeight),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        if (formKey.currentState!.validate()) {
                                          final user = UserModel(
                                            email: email.text.trim(),
                                            fullName: fullName.text.trim(),
                                            phoneNo: phoneNo.text.trim(),
                                          );
                                          await controller.updateRecord(user);
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: tPrimaryColor,
                                          side: BorderSide.none,
                                          shape: const StadiumBorder()),
                                      child: const Text(tEditProfile,
                                          style: TextStyle(color: tDarkColor)),
                                    ),
                                  ),
                                  const SizedBox(height: tFormHeight),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text.rich(
                                        TextSpan(
                                          text: tJoined,
                                          style: TextStyle(fontSize: 12),
                                          children: [
                                            TextSpan(
                                                text: tJoinedAt,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12))
                                          ],
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          // ****** delete account
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.redAccent
                                                .withOpacity(0.1),
                                            elevation: 0,
                                            foregroundColor: Colors.red,
                                            shape: const StadiumBorder(),
                                            side: BorderSide.none),
                                        child: const Text(tDelete),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      } else if (snapshot.hasError) {
                        return Center(child: Text(snapshot.error.toString()));
                      } else {
                        return const Center(
                            child: Text('Somthing went wrong.'));
                      }
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// pic files

/*final results = await FilePicker.platform.pickFiles( allowMultiple: false,

type: FileType.custom,
allowedExtensions: ['png', 'jpg'],);
if (results == null) {
Scaffold Messenger. of (context).showSnackBar(

const SnackBar(
content: Text('No file selected.'), ), // SnackBar
return null;);
}
final path = results.files.single.path!; final fileName = results.files.single.name;
print(path);
print (fileName);*/