import 'package:flutter/material.dart';

class SelectChild extends StatelessWidget {
  final String? selectedValue;
  final ValueChanged<String?> onChanged;

  const SelectChild({
    super.key,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(children: [
        const SizedBox(width: 20.0),
        Text("Kind auswählen:",
            style: Theme.of(context).textTheme.displayMedium!),
        const SizedBox(width: 10.0),
        DropdownButton<String>(
          value: selectedValue,
          hint: Text('Dein Kind auswählen',
              style: Theme.of(context).textTheme.displayMedium!),
          items: [
            DropdownMenuItem(
              value: 'Tim Birkholz',
              child: Text('Tim',
                  style: Theme.of(context).textTheme.displayMedium!),
            ),
            DropdownMenuItem(
              value: 'Nils Birkholz',
              child: Text('Nils',
                  style: Theme.of(context).textTheme.displayMedium!),
            ),
          ],
          onChanged: onChanged,
        ),
      ]),
    );
  }
}