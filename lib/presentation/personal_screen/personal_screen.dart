import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gokul_s_application3/widgets/custom_drop_down.dart';
import 'package:gokul_s_application3/widgets/custom_text_form_field.dart';
import 'package:gokul_s_application3/widgets/custom_elevated_button.dart';
import 'package:gokul_s_application3/core/app_export.dart';
import 'package:gokul_s_application3/widgets/custom_icon_button.dart';
import '/presentation/personal_screen/personal_screen copy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';


class PersonalScreen extends StatefulWidget {
  PersonalScreen({Key? key}) : super(key: key);
  @override
  _PersonalScreenState createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {

final databaseReference = FirebaseDatabase.instance.reference();


  List<String> dropdownItemList = [
    "Rice",
    "Coconut",
    "Onion",
    "Tomato",
    "Carrot",
    "Sugarcane",
  ];

  String selectedCrop = ""; // variable to store selected crop

  void handleDropdownChange(String value) {
    setState(() {
      selectedCrop = value;
      updateInputFields(selectedCrop); // update input fields based on selection
    });
  }

  void updateInputFields(String selectedCrop) {
    // Now based on the selected crop, you can update the values accordingly
    if (selectedCrop == 'Rice') {
      inputFieldController.text = '30';
      inputFieldController1.text = '150';
      inputFieldController2.text = '20';
      inputFieldController3.text = '8';
    } else if (selectedCrop == 'Coconut') {
      inputFieldController.text = '30';
      inputFieldController1.text = '300';
      inputFieldController2.text = '20';
      inputFieldController3.text = '28';
    } else if (selectedCrop == 'Onion') {
      inputFieldController.text = '40';
      inputFieldController1.text = '150';
      inputFieldController2.text = '30';
      inputFieldController3.text = '5';
    } else if (selectedCrop == 'Tomato') {
      inputFieldController.text = '150';
      inputFieldController1.text = '200';
      inputFieldController2.text = '30';
      inputFieldController3.text = '6';
    } else if (selectedCrop == 'Carrot') {
      inputFieldController.text = '100';
      inputFieldController1.text = '125';
      inputFieldController2.text = '30';
      inputFieldController3.text = '4';
    } else if (selectedCrop == 'Sugarcane') {
      inputFieldController.text = '50';
      inputFieldController1.text = '200';
      inputFieldController2.text = '30';
      inputFieldController3.text = '10';
    }
  }

  TextEditingController inputFieldController = TextEditingController();
  TextEditingController inputFieldController1 = TextEditingController();
  TextEditingController inputFieldController2 = TextEditingController();
  TextEditingController inputFieldController3 = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.all(23.h),
          child: Column(
            children: [
              
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 8.v),
                  child:
                      Text("Auto Nute", style: theme.textTheme.displaySmall)),
              Padding(
                  padding: EdgeInsets.only(bottom: 3.v),
                  child: CustomIconButton(
                      height: 45.v,
                      width: 47.h,
                      onTap: () {
                       // tsdbfd(context);
                       Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PersonalScreen1()),
            );
                      },
                      child: CustomImageView(
                          imagePath: 'assets/images/img_gear_icon_1.png',
                          )))
            ])
               
              ),
              SizedBox(height: 50.v),
              
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 16.h),
                  child: Text(
                    "Select the crop",
                    style: theme.textTheme.headlineSmall,
                  ),
                ),
              ),
              SizedBox(height: 31.v),
              Padding(
                padding: EdgeInsets.only(left: 16.h, right: 15.h),
                child: CustomDropDown(
                  icon: Container(
                    margin: EdgeInsets.fromLTRB(30.h, 24.v, 16.h, 18.v),
                    child: CustomImageView(
                      imagePath: ImageConstant.imgDownArrow1,
                      height: 13.v,
                      width: 16.h,
                    ),
                  ),
                  hintText: "Choose",
                  items: dropdownItemList,
                  onChanged: handleDropdownChange, // update input fields when dropdown item is changed
                ),
              ),
              SizedBox(height: 37.v),
              Text(
                "Or",
                style: CustomTextStyles.titleMediumPrimaryContainer,
              ),
              SizedBox(height: 36.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 16.h),
                  child: Text(
                    "Enter Nutrient Level",
                    style: theme.textTheme.headlineSmall,
                  ),
                ),
              ),
              SizedBox(height: 33.v),
              _buildInputField(context, "Nitrogen", inputFieldController),
              SizedBox(height: 33.v),
              _buildInputField(context, "Potassium", inputFieldController1),
              SizedBox(height: 33.v),
              _buildInputField(context, "Phosphorus", inputFieldController2),
              SizedBox(height: 33.v),
              _buildInputField(context, "Water Level", inputFieldController3,
                  textInputAction: TextInputAction.done),
              SizedBox(height: 33.v),
              _buildSubmit(context),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildInputField(
    BuildContext context,
    String hintText,
    TextEditingController controller, {
    TextInputType? textInputType,
    TextInputAction? textInputAction,
  }) {
    return Padding(
      padding: EdgeInsets.only(left: 16.h, right: 15.h),
      child: CustomTextFormField(
        controller: controller,
        hintText: hintText,
        textInputType: textInputType,
        textInputAction: textInputAction,
      ),
    );
  }

  /// Section Widget
  Widget _buildSubmit(BuildContext context) {
    return CustomElevatedButton(
      text: "Submit",
      margin: EdgeInsets.only(left: 16.h, right: 15.h),
      onPressed: () {
        personal_two(context);

        //for the databasse
        int water = int.tryParse(inputFieldController3.text) ?? 0;
        int n1 = int.tryParse(inputFieldController.text) ?? 0;
        int p1 = int.tryParse(inputFieldController1.text) ?? 0;
        int k1 = int.tryParse(inputFieldController2.text) ?? 0;

        databaseReference.child('message').set({'nwater': water, 
        'n1':n1,'k1':k1,'p1':p1});

      },
    );
  }

  /// Navigates to the personalTwoScreen when the action is triggered.
  personal_two(BuildContext context) {
    Navigator.popAndPushNamed(context, AppRoutes.personalTwoScreen);
  }

    
}
