// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:msa_app/models/models.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PrintPdf extends StatefulWidget {
  final HtmlSNSForm? data;
  const PrintPdf({Key? key, this.data}) : super(key: key);

  @override
  State<PrintPdf> createState() => _PrintPdfState();
}

class _PrintPdfState extends State<PrintPdf> {
  final TextEditingController _textFieldController = TextEditingController();
  final FocusNode _textFieldFocus = FocusNode();

  final doc = pw.Document();
  final _formKey = GlobalKey<FormState>();

  String nameInfo = "";
  String valueText = "";

  @override
  Widget build(BuildContext context) {
    void printDocument(String nameInfo) {
      Printing.layoutPdf(
        onLayout: (pageFormat) async {
          return await Printing.convertHtml(
            format: PdfPageFormat.standard,
            html: HtmlFormResult(widget.data!, "form1", nameInfo),
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
              content: Form(
                key: _formKey,
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      valueText = value;
                    });
                  },
                  validator: (String? val) {
                    if (val == null || val.isEmpty) {
                      return translate("validate.empty");
                    }
                    return null;
                  },
                  focusNode: _textFieldFocus,
                  controller: _textFieldController,
                  decoration: InputDecoration(
                      hintText: translate("alert_result.hint_form")),
                ),
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
                      if (_formKey.currentState!.validate()) {
                        nameInfo = valueText;
                        printDocument(nameInfo);
                        _textFieldController.clear();
                        Navigator.pop(context);
                      }
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
