import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  double _startAge = 18;
  double _endAge = 28;
  bool verifiedPhotosOnly = false;
  bool excludeMessaged = false;
  bool showLikedMe = false;
  int selectedSearchOption = 2; // Default: Search by City/Place

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            "Close",
            style: TextStyle(color: Colors.blue, fontSize: 18),
          ),
        ),
        title: const Text(
          "Search Settings",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          children: [
            const SizedBox(height: 10),
            // Gender Selection
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Gender", style: TextStyle(fontSize: 16)),
                Text("Transgender",
                    style: TextStyle(fontSize: 16, color: Colors.black54)),
              ],
            ),
            const Divider(),

            // Age Range Slider
            const SizedBox(height: 10),
            const Text("Age Range",
                style: TextStyle(fontSize: 16, color: Colors.black54)),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                rangeThumbShape:
                    const RoundRangeSliderThumbShape(enabledThumbRadius: 8),
              ),
              child: RangeSlider(
                values: RangeValues(_startAge, _endAge),
                min: 18,
                max: 60,
                divisions: 42,
                labels:
                    RangeLabels("${_startAge.toInt()}", "${_endAge.toInt()}"),
                onChanged: (RangeValues values) {
                  setState(() {
                    _startAge = values.start;
                    _endAge = values.end;
                  });
                },
              ),
            ),
            Text("${_startAge.toInt()}-${_endAge.toInt()}",
                textAlign: TextAlign.right,
                style: const TextStyle(fontSize: 16)),

            const SizedBox(height: 10),
            // Verified Photos Only
            SwitchListTile(
              title: const Text("Verified Photos Only"),
              value: verifiedPhotosOnly,
              onChanged: (bool value) {
                setState(() {
                  verifiedPhotosOnly = value;
                });
              },
              activeColor: Colors.blue,
            ),
            // Exclude Messaged Already
            SwitchListTile(
              title: const Text("Exclude messaged already"),
              value: excludeMessaged,
              onChanged: (bool value) {
                setState(() {
                  excludeMessaged = value;
                });
              },
              activeColor: Colors.blue,
            ),
            // Show only who liked me
            SwitchListTile(
              title: const Text("Show only who liked me"),
              value: showLikedMe,
              onChanged: (bool value) {
                setState(() {
                  showLikedMe = value;
                });
              },
              activeColor: Colors.blue,
            ),

            const SizedBox(height: 10),
            // Time Selection Tabs
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _timeFilterButton("ONLINE NOW"),
                _timeFilterButton("TODAY"),
                _timeFilterButton("THIS WEEK"),
                _timeFilterButton("ANYTIME"),
              ],
            ),

            SizedBox(height: 20),
            // Search Options
            _searchOption(0, "Search Near Me"),
            _searchOption(1, "Search Everywhere"),
            _searchOption(2, "Search by City / Place"),

            if (selectedSearchOption == 2) ...[
              const SizedBox(height: 10),
              const Text("Pattaya",
                  style: TextStyle(fontSize: 16, color: Colors.black)),
              SizedBox(height: 10),
              // Map Placeholder
              Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage("assets/map_placeholder.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }

  // Time Filter Button
  Widget _timeFilterButton(String title) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(title, style: TextStyle(fontSize: 14)),
      ),
    );
  }

  // Search Option Radio Button
  Widget _searchOption(int value, String text) {
    return RadioListTile(
      title: Text(text),
      value: value,
      groupValue: selectedSearchOption,
      onChanged: (int? newValue) {
        setState(() {
          selectedSearchOption = newValue!;
        });
      },
      activeColor: Colors.blue,
    );
  }
}
