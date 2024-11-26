import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';

import 'dart:typed_data';

import 'package:printing/printing.dart';

var logger = Logger();

class ApologyPage extends StatelessWidget {
  final String title = 'Entschuldigungsschreiben';
  final Map<String, String> allElements;

  const ApologyPage({super.key, required this.allElements});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text(title)),
        body: PdfPreview(
          build: (format) => generatePdf(allElements),
        ),
      ),
    );
  }

  Future<Uint8List> generatePdf(Map<String, String> allElements) async {
    // text formats
    pw.TextStyle formatH2 = const pw.TextStyle(
      fontSize: 13.0,
    );
    pw.TextStyle formatH3 = const pw.TextStyle(
      fontSize: 12.0,
    );
    pw.TextStyle formatB = pw.TextStyle(
      fontSize: 12.0,
      fontWeight: pw.FontWeight.bold,
    );
    pw.TextStyle formatP = const pw.TextStyle(
      fontSize: 12,
    );

    final DateFormat formatter = DateFormat('d.MM.yyyy');
    final String toDay = formatter.format(DateTime.now());
    const double distance = 6.0;

    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (context) {
            return pw.Column(
              children: [
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text(
                    allElements['parents']!,
                    style: formatH2,
                  ),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text(
                    allElements['homeAdress']!,
                    style: formatH3,
                  ),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text(
                    allElements['communication']!,
                    style: formatH3,
                  ),
                ),
                pw.SizedBox(width: 200, height: 140),
                pw.Container(
                  alignment: pw.Alignment.centerLeft,
                  child: pw.Text(
                    allElements['schoolAdress']!,
                    style: formatP,
                  ),
                ),
                pw.Container(
                  alignment: pw.Alignment.centerLeft,
                  child: pw.Text(
                    allElements['teacher']!,
                    style: formatP,
                  ),
                ),
                pw.SizedBox(width: 200, height: 120),
                pw.Container(
                  alignment: pw.Alignment.centerRight,
                  child: pw.Text(
                    toDay,
                    style: formatP,
                  ),
                ),
                pw.Container(
                  alignment: pw.Alignment.centerLeft,
                  height: 18.0,
                  child: pw.Text(
                    '${allElements['titleRow']!} ${allElements['absenceStart']!}',
                    style: formatB,
                  ),
                ),
                pw.SizedBox(height: distance),
                pw.Container(
                  alignment: pw.Alignment.centerLeft,
                  child: pw.Text(
                    '${allElements['salutation']!} ${allElements['teacher']!}${','}',
                    style: formatP,
                  ),
                ),
                pw.Container(
                  height: 24.0,
                  alignment: pw.Alignment.centerLeft,
                  child: pw.Text(
                    '${allElements['reasonTextPart1']!} ${allElements['childName']!} ${allElements['reasonTextPart2']!}',
                    style: formatP,
                  ),
                ),
                pw.Container(
                  height: 18.0,
                  alignment: pw.Alignment.centerLeft,
                  child: pw.Text(
                    allElements['pleaseExcuse']!,
                    style: formatP,
                  ),
                ),

                pw.Container(
                  alignment: pw.Alignment.centerLeft,
                  height: 30.0,
                  child: pw.Text(
                    allElements['endOfLetter']!,
                    style: formatP,
                  ),
                ),
              ],
              //crossAxisAlignment: pw.CrossAxisAlignment.start,
            );
          }),
    );
    return pdf.save();
  }
}