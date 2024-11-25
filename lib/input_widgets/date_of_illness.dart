import 'package:flutter/material.dart';
import 'package:date_picker_plus/date_picker_plus.dart';

class DateOfIllness extends StatefulWidget {
  final Function(DateTimeRange) onSelected; // Callback to parent
  const DateOfIllness({required this.onSelected, super.key});

  @override
  DateOfIllnessState createState() => DateOfIllnessState();
}

class DateOfIllnessState extends State<DateOfIllness> {
  final TextEditingController _controller = TextEditingController();

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
                minDate: DateTime(2024, 10, 10),
                maxDate: DateTime(2025, 10, 30),
                initialDate: DateTime(2024, 11),
                onRangeSelected: widget.onSelected,
                disabledCellsDecoration: const BoxDecoration(
                  color: Colors.yellow,
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
