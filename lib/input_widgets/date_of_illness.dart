import 'package:flutter/material.dart';
import 'package:date_picker_plus/date_picker_plus.dart';

class DateOfIllness extends StatefulWidget {
  final Function(DateTimeRange) onSelected; // Callback to parent
  const DateOfIllness({required this.onSelected, super.key});

  @override
  DateOfIllnessState createState() => DateOfIllnessState();
}

class DateOfIllnessState extends State<DateOfIllness> {

  DateTime today = DateTime.now();
  int daysFromToday = 14;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Entschuldigungszeitraum",
                style: Theme.of(context).textTheme.displayMedium!),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: // Zeitraum
                SizedBox(
              width: 300,
              height: 400,
              child: RangeDatePicker(
                centerLeadingDate: true,
                minDate: today.subtract(Duration(days: daysFromToday)),
                maxDate: today.add(Duration(days: daysFromToday)),
                initialDate: today,
                onRangeSelected: widget.onSelected,
                disabledCellsDecoration: const BoxDecoration(
                  color: Colors.redAccent,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
