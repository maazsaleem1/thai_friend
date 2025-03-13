import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:thai_friendly_app/auhtmoduulescreen/how_tall_are_you_screen.dart';
import 'package:thai_friendly_app/onboardingfolder/custom_button.dart';
import 'package:thai_friendly_app/res/appcolors.dart';

class DateOfBirthPicker extends StatelessWidget {
  final RxString selectedYear = ''.obs;
  final RxString selectedMonth = ''.obs;
  final RxString selectedDay = ''.obs;

  final RxBool showYearGrid = false.obs;
  final RxBool showMonthGrid = false.obs;
  final RxBool showDayGrid = false.obs;

  final List<String> years = List.generate(40, (index) => '${2025 - index}');
  final List<String> months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

  DateOfBirthPicker({super.key});

  List<String> getDays() {
    if (selectedMonth.value.isEmpty) {
      return List.generate(31, (index) => '${index + 1}'.padLeft(2, '0'));
    }

    int monthIndex = months.indexOf(selectedMonth.value) + 1;
    int year = int.tryParse(selectedYear.value) ?? DateTime.now().year;

    int daysInMonth = DateTime(year, monthIndex + 1, 0).day;
    return List.generate(daysInMonth, (index) => '${index + 1}'.padLeft(2, '0'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.pinksahdebackground,
        body: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Text(
                  "Date of Birth",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showYearGrid.toggle();
                        showMonthGrid.value = false;
                        showDayGrid.value = false;
                      },
                      child: Obx(() => Text(selectedYear.value.isEmpty ? "YYYY" : selectedYear.value, style: _labelStyle())),
                    ),
                    const SizedBox(width: 40),
                    GestureDetector(
                      onTap: () {
                        showMonthGrid.toggle();
                        showYearGrid.value = false;
                        showDayGrid.value = false;
                      },
                      child: Obx(() => Text(selectedMonth.value.isEmpty ? "MM" : selectedMonth.value, style: _labelStyle())),
                    ),
                    const SizedBox(width: 40),
                    GestureDetector(
                      onTap: () {
                        showDayGrid.toggle();
                        showYearGrid.value = false;
                        showMonthGrid.value = false;
                      },
                      child: Obx(() => Text(selectedDay.value.isEmpty ? "DD" : selectedDay.value, style: _labelStyle())),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const Text(
                  "What year were you born?",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),

                // Year Grid
                Obx(() => showYearGrid.value ? _buildWrapGrid(years, selectedYear, showYearGrid) : const SizedBox.shrink()),

                // Month Grid
                Obx(() => showMonthGrid.value ? _buildWrapGrid(months, selectedMonth, showMonthGrid) : const SizedBox.shrink()),

                // Day Grid (Dynamic)
                Obx(() => showDayGrid.value ? _buildWrapGrid(getDays(), selectedDay, showDayGrid) : const SizedBox.shrink()),

                const Spacer(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 20.h), // Adjust the space from the bottom
          child: BottomAppBar(
            clipBehavior: Clip.none,
            color: AppColors.pinksahdebackground,
            child: AppButton(
              onPress: () {
                Get.to(() => const HowTallAreYouScreen());
              },
              horizontalMargin: 30,
              text: "Continue",
              backgroundColor: AppColors.buttoncolourforapp,
            ),
          ),
        ));
  }

  TextStyle _labelStyle() {
    return const TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    );
  }

  Widget _buildWrapGrid(List<String> items, RxString selectedValue, RxBool visibility) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: items.map((item) {
        final isSelected = item == selectedValue.value;
        return GestureDetector(
          onTap: () {
            selectedValue.value = item;
            // visibility.value = false;
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.tealbackground : AppColors.tealbackground.withOpacity(0.5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              item,
              style: TextStyle(color: AppColors.white, fontSize: 16, fontWeight: isSelected ? FontWeight.w700 : FontWeight.w300),
            ),
          ),
        );
      }).toList(),
    );
  }
}
