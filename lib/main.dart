import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:app_apology/input_widgets/date_of_illness.dart';
import 'package:app_apology/apology_page.dart';
import 'package:app_apology/input_widgets/select_child.dart';

void main() {
  runApp(const MyApology());
}

var logger = Logger();

class MyApology extends StatelessWidget {
  const MyApology({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        // Define the default brightness and colors.


        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(

          // ···
          titleLarge: GoogleFonts.notoSans(
            fontSize: 20,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          bodyMedium: GoogleFonts.notoSans(
            fontSize: 18,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            color: Colors.blue,
          ),
          bodySmall: GoogleFonts.notoSans(),
          displayMedium: GoogleFonts.notoSans(fontSize: 16,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            color: Colors.blue, ),
        ),
      ),
      home: const StartingPage(title: 'Entschuldigung für die Schule'),
    );
  }
}

class StartingPage extends StatefulWidget {
  const StartingPage({super.key, required this.title});

  final String title;

  @override
  State<StartingPage> createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  // State variable to hold the selected value
  String? selectedChild = "Tim Birkholz";
  String? appologyPeriode = "12.12.2023";

  @override
  Widget build(BuildContext context) {
    final Map<String, String> allElements = HashMap();
    allElements['parents'] = "Tanja Birkholz und Christian Buchsteiner";
    allElements['homeAdress'] = "Wacholderweg 15a, 61440 Oberursel";
    allElements['communication'] =
    "Tel. 01516 144 80 98, mail: chrbuchsteiner@gmail.com";
    allElements['schoolAdress'] = "Gymnasium Oberursel";
    allElements['teacher'] = "Frau Brendel";

    allElements['titleRow'] = "Entschuldigung";
    allElements['salutation'] = "Sehr geehrte";
    allElements['reasonTextPart1'] = "unser Sohn";
    allElements['reasonTextPart2'] =
    "war krank und konnte nicht am Unterricht teilnehmen.";
    allElements['pleaseExcuse'] =
    "Wir bitten Sie, sein Fehlen zu entschuldigen.";
    allElements['endOfLetter'] = "Mit freundlichen Grüßen";

    allElements['appologyDate'] = appologyPeriode!;
    allElements['childName'] = selectedChild!;

    // logger.d(allElements);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          DateOfIllness(
            onSubmitted: (value) {
              setState(() {
                appologyPeriode = value; // Update state with periode input
              });
            },
          ),
          SelectChild(
            selectedValue: selectedChild,
            onChanged: (value) {
              setState(() {
                selectedChild = value;
              });
            },
          ),
          FloatingActionButton(
            onPressed: () async {

              allElements['childName'] = selectedChild!;

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ApologyPage(
                    allElements: allElements,
                  ),
                ),
              );
            },
            child: const Icon(Icons.print), //
          ),
        ],
      ),
    );
  }
}