import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gokul_s_application3/widgets/custom_drop_down.dart';
import 'package:gokul_s_application3/widgets/custom_text_form_field.dart';
import 'package:gokul_s_application3/widgets/custom_elevated_button.dart';
import 'package:gokul_s_application3/core/app_export.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class PersonalScreen1 extends StatelessWidget {
  PersonalScreen1({Key? key}) : super(key: key);

  final databaseReference = FirebaseDatabase.instance.reference();

  TextEditingController inputFieldController = TextEditingController();

  TextEditingController inputFieldController1 = TextEditingController();

  TextEditingController inputFieldController2 = TextEditingController();

  TextEditingController inputFieldController3 = TextEditingController();

  TextEditingController inputFieldController4 = TextEditingController();

  TextEditingController inputFieldController5 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.all(23.h),
                child: Column(children: [
                  //SizedBox(height: 36.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 15.h),
                          child: Text("Nitrogen ",
                              style: theme.textTheme.headlineSmall))),
                  SizedBox(height: 27.v),
                  _buildInputField(context),
                  SizedBox(height: 30.v),
                  _buildInputField1(context),
                  SizedBox(height: 32.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 15.h),
                          child: Text("Phosphorus ",
                              style: theme.textTheme.headlineSmall))),
                  SizedBox(height: 27.v),
                  _buildInputField2(context),
                  SizedBox(height: 30.v),
                  _buildInputField3(context),
                  SizedBox(height: 30.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 15.h),
                          child: Text("Potassium ",
                              style: theme.textTheme.headlineSmall))),
                  SizedBox(height: 29.v),
                  _buildInputField4(context),
                  SizedBox(height: 30.v),
                  _buildInputField5(context),
                  SizedBox(height: 30.v),
                  _buildSubmit(context),
                  SizedBox(height: 5.v)
                ]))));
  }

  /// Section Widget
  Widget _buildInputField(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 15.h, right: 16.h),
        child: CustomTextFormField(
            controller: inputFieldController, hintText: "Nitrogen"));
  }

  /// Section Widget
  Widget _buildInputField1(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 15.h, right: 16.h),
        child: CustomTextFormField(
            controller: inputFieldController1, hintText: "Water level"));
  }

  /// Section Widget
  Widget _buildInputField2(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 15.h, right: 16.h),
        child: CustomTextFormField(
            controller: inputFieldController2, hintText: "phosphorus"));
  }

  /// Section Widget
  Widget _buildInputField3(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 15.h, right: 16.h),
        child: CustomTextFormField(
            controller: inputFieldController3, hintText: "Water level"));
  }

  /// Section Widget
  Widget _buildInputField4(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 15.h, right: 16.h),
        child: CustomTextFormField(
            controller: inputFieldController4, hintText: "potassium"));
  }

  /// Section Widget
  Widget _buildInputField5(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 15.h, right: 16.h),
        child: CustomTextFormField(
            controller: inputFieldController5,
            hintText: "Water level",
            textInputAction: TextInputAction.done));
  }

  /// Section Widget
  Widget _buildSubmit(BuildContext context) {
    return CustomElevatedButton(
        text: "Submit",
        margin: EdgeInsets.only(left: 15.h, right: 16.h),
        onPressed: () {
          Navigator.pushNamed(
                                context,
                                AppRoutes.personalScreen,
                              );

        int ns = int.tryParse(inputFieldController.text) ?? 0;
        int nw = int.tryParse(inputFieldController1.text) ?? 0;
        int ps = int.tryParse(inputFieldController2.text) ?? 0;
        int pw = int.tryParse(inputFieldController3.text) ?? 0;
        int ks = int.tryParse(inputFieldController4.text) ?? 0;
        int kw = int.tryParse(inputFieldController5.text) ?? 0;


        databaseReference.child('subvalue').set({'ns': ns, 
        'nw':nw,'ks':ks,'kw':kw, 'ps':ps, 'pw':pw});
        });
  }

  /// Navigates to the personalTwoScreen when the action is triggered.
  xfxx(BuildContext context) {
    Navigator.popAndPushNamed(context, AppRoutes.personalTwoScreen);
  }
}
