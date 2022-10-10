// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PrintPdf extends StatefulWidget {
  const PrintPdf({Key? key}) : super(key: key);

  @override
  State<PrintPdf> createState() => _PrintPdfState();
}

class _PrintPdfState extends State<PrintPdf> {
  final doc = pw.Document();
  String htmlFile = "";

  getData() async {
    String res;
    res = await rootBundle.loadString("assets/html/formphase1-en.html");
    setState(() {
      htmlFile = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    void _printDocument() {
      Printing.layoutPdf(
        onLayout: (pageFormat) async {
          return await Printing.convertHtml(
            format: PdfPageFormat.standard,
            html: htmlFile,
          );
        },
      );
    }

    return TextButton(
      onPressed: () => {
        getData(),
        _printDocument(),
      },
      child: Text(
        translate("results_page.button_print_download"),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
