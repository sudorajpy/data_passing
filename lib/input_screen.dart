import 'package:data_passing/output_screen.dart';
import 'package:data_passing/user_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';



class InputScreen extends StatefulWidget {
  
  const InputScreen({Key? key}) : super(key: key);

  @override
  State<InputScreen> createState() => _InputScreenState();
}

final List<String> availableDays = [
  'All Days',
  'Sunday',
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
];



class _InputScreenState extends State<InputScreen> {
  final UserData userData = UserData(availbilityDays: []);
  bool isAllDaysSelected = false;
  List<String> selectedDays = [];

  @override
  void initState() {
    super.initState();
    selectedDays = userData.availbilityDays;
    isAllDaysSelected = selectedDays.contains('All Days');
  }

  void toggleDay(String day) {
    setState(() {
      if (day == 'All Days') {
        if (isAllDaysSelected) {
          selectedDays = [...availableDays];
        }
         else {
          selectedDays = [];
        }
        isAllDaysSelected = !isAllDaysSelected;
      } else {
        if (selectedDays.contains('All Days')) {
          selectedDays.remove('All Days');
          isAllDaysSelected = false;
        }
        if (selectedDays.contains(day)) {
          selectedDays.remove(day);
        } else {
          selectedDays.add(day);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Availability",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Color(0xff3A424A),
              fontSize: 24,
              fontFamily: "All-Round-Gothic-W01-Bold",
              fontStyle: FontStyle.normal,
            )),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            const Text(
              'Available days and times',
              style: TextStyle(
                fontSize: 17,
                fontFamily: "All-Round-Gothic-W01-Bold",
                fontStyle: FontStyle.normal,
                color: Color(0xff3A424A),
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            // day switch
            for (String day in availableDays)
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: <Widget>[
                    Text(
                      day,
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'Montserrat',
                        color: Color(0xff424242),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Spacer(),
                    FlutterSwitch(
                      width: 55,
                      height: 30,
                      showOnOff: false,
                      activeColor: const Color(0xff54606D),
                      inactiveColor: const Color(0XFFEEEEEE),
                      value: selectedDays.contains(day),
                      onToggle: (value) => toggleDay(day),
                    ),
                  ],
                ),
              ),

            const Spacer(),
            Container(
              height: 50,
              margin: const EdgeInsets.all(7),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: const Color(0XFF54606D), elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  minimumSize: const Size(100, 40),
                ),
                onPressed: () {
                 userData.availbilityDays = selectedDays;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => OutputScreen(userData: userData),
                    ),
                  );
                },
                child: const Text(
                  'Next',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'Montserrat',
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}