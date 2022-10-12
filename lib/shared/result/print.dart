// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:msa_app/models/models.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../models/html_template.dart';

class PrintPdf extends StatefulWidget {
  final HtmlSNSForm data;
  const PrintPdf({Key? key, required this.data}) : super(key: key);

  @override
  State<PrintPdf> createState() => _PrintPdfState();
}

class _PrintPdfState extends State<PrintPdf> {
  final doc = pw.Document();

  @override
  Widget build(BuildContext context) {
    void printDocument() {
      Printing.layoutPdf(
        onLayout: (pageFormat) async {
          return await Printing.convertHtml(
            format: PdfPageFormat.standard,
            html: HtmlFormResult(widget.data, "form1"),
          );
        },
      );
    }

    return TextButton(
      onPressed: () => {
        printDocument(),
      },
      child: Text(
        translate("results_page.button_print_download"),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
