import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:gokul_s_application3/core/app_export.dart';
import 'package:gokul_s_application3/widgets/custom_elevated_button.dart';

class PersonalTwoScreen extends StatefulWidget {
  const PersonalTwoScreen({Key? key}) : super(key: key);

  @override
  _PersonalTwoScreenState createState() => _PersonalTwoScreenState();
}

class _PersonalTwoScreenState extends State<PersonalTwoScreen> {
  DatabaseReference? databaseReference; // Nullable reference

  bool _isButton1Pressed = true;
  bool _isButton2Pressed = true;
  bool _isButton3Pressed = true;
  bool _isButton4Pressed = true;

  int wat = 0; // Example values
  int nn = 0; // Example values
  int pp = 0; // Example values
  int kk = 0; // Example values

  @override
  void initState() {
    super.initState();
    // Initialize databaseReference
    databaseReference = FirebaseDatabase.instance.reference();
    // Check if databaseReference is not null
    if (databaseReference != null) {
      getvalue();
      // Refresh values every 5 milliseconds
      Timer.periodic(Duration(milliseconds: 5), (timer) {
        getvalue();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 33.h, vertical: 31.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Loaded", style: CustomTextStyles.headlineLargeBold),
              SizedBox(height: 44.v),
              Text("Current Values", style: theme.textTheme.headlineSmall),
              SizedBox(height: 45.v),
              Padding(
                padding: EdgeInsets.only(right: 1.h),
                child: _buildTwentyOne(
                  context,
                  pottassium: "Water : $wat",
                  phosphorus: "Nitrogen : $nn",
                ),
              ),
              SizedBox(height: 28.v),
              Padding(
                padding: EdgeInsets.only(right: 1.h),
                child: _buildTwentyOne(
                  context,
                  pottassium: "Potassium : $kk",
                  phosphorus: "Phosphorus : $pp",
                ),
              ),
              SizedBox(height: 47.v),
              Text("ON / OFF", style: theme.textTheme.headlineSmall),
              SizedBox(height: 44.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildButton(context, "Water", !_isButton1Pressed),
                  SizedBox(width: 20.h),
                  _buildButton(context, "Nitrogen", !_isButton2Pressed),
                ],
              ),
              SizedBox(height: 20.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildButton(context, "Pottassium", !_isButton3Pressed),
                  SizedBox(width: 20.h),
                  _buildButton(context, "Phosphorus", !_isButton4Pressed),
                ],
              ),
              SizedBox(height: 48.v),
              Text("To change the crop", style: theme.textTheme.headlineSmall),
              SizedBox(height: 42.v),
              CustomElevatedButton(
                text: "Back",
                margin: EdgeInsets.only(right: 11.h),
                onPressed: () {
                  personal(context);
                },
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTwentyOne(
    BuildContext context, {
    required String pottassium,
    required String phosphorus,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 165.h,
          padding: EdgeInsets.fromLTRB(16.h, 18.v, 20.h, 18.v),
          decoration: AppDecoration.outlinePrimary.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder10,
          ),
          child: Text(
            pottassium,
            style: theme.textTheme.bodyLarge!.copyWith(
              color: theme.colorScheme.secondaryContainer,
            ),
          ),
        ),
        Container(
          width: 165.h,
          padding: EdgeInsets.fromLTRB(16.h, 18.v, 10.h, 18.v),
          decoration: AppDecoration.outlinePrimary.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder10,
          ),
          child: Text(
            phosphorus,
            style: theme.textTheme.bodyLarge!.copyWith(
              color: theme.colorScheme.secondaryContainer,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildButton(BuildContext context, String buttonText, bool isPressed) {
    return GestureDetector(
      onTap: () {
        setState(() {
          switch (buttonText) {
            case "Water":
              _isButton1Pressed = !_isButton1Pressed;
              updateFirebase(buttonText, !_isButton1Pressed);
              break;
            case "Nitrogen":
              _isButton2Pressed = !_isButton2Pressed;
              updateFirebase(buttonText, !_isButton2Pressed);
              break;
            case "Pottassium":
              _isButton3Pressed = !_isButton3Pressed;
              updateFirebase(buttonText, !_isButton3Pressed);
              break;
            case "Phosphorus":
              _isButton4Pressed = !_isButton4Pressed;
              updateFirebase(buttonText, !_isButton4Pressed);
              break;
          }
          // Update the value in Firebase
        });
      },
      child: Container(
        width: 125,
        height: 56,
        decoration: AppDecoration.outlinePrimary.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder10,
          color: isPressed ? const Color(0XFFECECF1) : null,
        ),
        alignment: Alignment.center,
        child: Text(
          buttonText,
          style: theme.textTheme.bodyLarge!.copyWith(
            color: isPressed ? Color.fromARGB(255, 0, 0, 0) : null,
          ),
        ),
      ),
    );
  }

  void personal(BuildContext context) {
    Navigator.popAndPushNamed(context, AppRoutes.personalScreen);
  }

  void getvalue() {
    if (databaseReference == null) return; // Null check

    databaseReference!.child('values/cwater').once().then((DatabaseEvent event) {
  if (event.snapshot.value != null) {
    setState(() {
      wat = int.parse(event.snapshot.value.toString());
    });
  }
});

      databaseReference!.child('values/val1').once().then((DatabaseEvent event) {
  if (event.snapshot.value != null) {
    setState(() {
      nn = int.parse(event.snapshot.value.toString());
    });
  }
});

  databaseReference!.child('values/val2').once().then((DatabaseEvent event) {
  if (event.snapshot.value != null) {
    setState(() {
      pp = int.parse(event.snapshot.value.toString());
    });
  }
});

  databaseReference!.child('values/val3').once().then((DatabaseEvent event) {
  if (event.snapshot.value != null) {
    setState(() {
      kk = int.parse(event.snapshot.value.toString());
    });
  }
});
  }


  void updateFirebase(String key, bool value) {
    if (databaseReference == null) return; // Null check
    databaseReference!.child('values/$key').set(value);
  }
}
