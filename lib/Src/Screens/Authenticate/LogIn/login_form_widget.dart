import 'package:alqgp/Src/Screens/Authenticate/ForgotPassword/forgotPass_button_seet.dart';
import 'package:alqgp/Src/Screens/Authorized/homeWrapper.dart';
import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:alqgp/Src/Utils/Consts/text.dart';
import 'package:alqgp/Src/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: tFormHeight),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                label: Text(tEmail),
                prefixIcon: Icon(Icons.person_outline_outlined),
              ),
            ),
            // TextFormField(
            //   decoration: const InputDecoration(
            //       prefixIcon: Icon(Icons.person_outline_outlined),
            //       labelText: tEmail,
            //       hintText: tEmail,
            //       border: OutlineInputBorder()),
            // ),
            const SizedBox(height: tFormHeight - 20),
            Obx(
              () => TextFormField(
                decoration: InputDecoration(
                  label: Text(tPassword),
                  prefixIcon: Icon(Icons.fingerprint),
                  suffixIcon: IconButton(
                    onPressed: (() {
                      controller.changeShow();
                    }),
                    icon: controller.notshowpass.value
                        ? Icon(Icons.remove_red_eye_sharp)
                        : Icon(Icons.remove_red_eye_outlined),
                  ),
                ),
                obscureText: controller.notshowpass.value,
              ),
            ),
            // TextFormField(
            //   decoration: const InputDecoration(
            //     prefixIcon: Icon(Icons.fingerprint),
            //     labelText: tPassword,
            //     hintText: tPassword,
            //     border: OutlineInputBorder(),
            //     suffixIcon: IconButton(
            //       onPressed: null,
            //       icon: Icon(Icons.remove_red_eye_sharp),
            //     ),
            //   ),
            // ),
            const SizedBox(height: tFormHeight - 20),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {
                    ForgetPasswordScreen.buildShowModalBottomSheet(context);
                  },
                  child: const Text(tForgetPassword,
                      style: TextStyle(color: Colors.blue))),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // LoginController.instance.loginUser(
                  //     controller.email.text.trim(),
                  //     controller.password.text.trim());
                  Get.offAll(() => HomeWrapper());
                },
                child: Text(tLogin.toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
