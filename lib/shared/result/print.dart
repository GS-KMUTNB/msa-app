// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:msa_app/models/models.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PrintPdf extends StatefulWidget {
  final HtmlSNSForm data;
  const PrintPdf({Key? key, required this.data}) : super(key: key);

  @override
  State<PrintPdf> createState() => _PrintPdfState();
}

class _PrintPdfState extends State<PrintPdf> {
  final TextEditingController _textFieldController = TextEditingController();
  final doc = pw.Document();

  String nameInfo = "";
  String valueText = "";

  @override
  Widget build(BuildContext context) {
    void printDocument(String nameInfo) {
      Printing.layoutPdf(
        onLayout: (pageFormat) async {
          return await Printing.convertHtml(
            format: PdfPageFormat.standard,
            html: HtmlFormResult(widget.data, "form1", nameInfo),
          );
        },
      );
    }

    Future<void> formEditorDialog(BuildContext context) async {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(translate("alert_result.title_form")),
              content: TextField(
                onChanged: (value) {
                  setState(() {
                    valueText = value;
                  });
                },
                controller: _textFieldController,
                decoration: InputDecoration(
                    hintText: translate("alert_result.hint_form")),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text(translate("warning_page_start.button_cancel")),
                  onPressed: () {
                    setState(() {
                      _textFieldController.clear();
                      Navigator.pop(context);
                    });
                  },
                ),
                TextButton(
                  child: Text(translate("warning_page_start.button_agree")),
                  onPressed: () {
                    setState(() {
                      nameInfo = valueText;
                      printDocument(nameInfo);
                    });
                  },
                ),
              ],
            );
          });
    }

    return TextButton(
      onPressed: () => formEditorDialog(context),
      child: Text(
        translate("results_page.button_print_download"),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
