import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thai_friendly_app/customs_widgets/app_text.dart';
import 'package:thai_friendly_app/res/appcolors.dart';

class GenderSelectionScreen extends StatefulWidget {
  const GenderSelectionScreen({super.key});

  @override
  _GenderSelectionScreenState createState() => _GenderSelectionScreenState();
}

class _GenderSelectionScreenState extends State<GenderSelectionScreen> {
  String? selectedGender = "Women";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundlight,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: AppText(text: "Gender", fontSize: 18.sp, fontWeight: FontWeight.w800, color: AppColors.black),
        backgroundColor: AppColors.white,
      ),
      body: Column(
        children: [
          genderTile("Women"),
          genderTile("Men"),
          genderTile("Transgender"),
          genderTile("Women and Transgender"),
        ],
      ),
    );
  }

  Widget genderTile(String gender) {
    return RadioListTile<String>(
      title: AppText(text: gender, fontSize: 15.sp, fontWeight: FontWeight.w500, color: AppColors.black),
      value: gender,
      groupValue: selectedGender,
      activeColor: Colors.blue,
      onChanged: (String? value) {
        setState(() {
          selectedGender = value;
        });
      },
    );
  }
}
