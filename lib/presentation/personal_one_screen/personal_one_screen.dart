import 'package:flutter/material.dart';
import 'package:gokul_s_application3/widgets/custom_text_form_field.dart';
import 'package:gokul_s_application3/widgets/custom_elevated_button.dart';
import 'package:gokul_s_application3/core/app_export.dart';

class PersonalOneScreen extends StatelessWidget {
  PersonalOneScreen({Key? key}) : super(key: key);

  TextEditingController userIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(
                  horizontal: 38.h,
                  vertical: 163.v,
                ),
                child: SizedBox(
                  height: 500,
                  child: Column(
                    children: [
                      Text(
                        "Log IN",
                        style: theme.textTheme.headlineLarge,
                      ),
                      Spacer(
                        flex: 45,
                      ),
                      CustomTextFormField(
                        controller: userIdController,
                        hintText: "User ID",
                      ),
                      SizedBox(height: 24.v),
                      CustomTextFormField(
                        controller: passwordController,
                        hintText: "Password",
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.visiblePassword,
                        obscureText: true,
                        contentPadding: EdgeInsets.only(
                          left: 16.h,
                          top: 18.v,
                          bottom: 18.v,
                        ),
                      ),
                      SizedBox(height: 20.v),
                      CustomElevatedButton(
                        text: "LogIn",
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Check user ID and password
                            if (userIdController.text == "autonute" &&
                                passwordController.text == "nutenpk") {
                              // Navigate to next screen
                              Navigator.pushNamed(
                                context,
                                AppRoutes.personalScreen,
                              );
                            } else {
                              // Show error message if credentials are incorrect
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Invalid user ID or password.'),
                                ),
                              );
                            }
                          }
                        },
                      ),
                      Spacer(
                        flex: 54,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }



  /// Navigates to the personalScreen when the action is triggered.
  personalone(BuildContext context) {
    Navigator.popAndPushNamed(context, AppRoutes.personalScreen);
  }
}
