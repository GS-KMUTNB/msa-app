import 'package:flutter_translate/flutter_translate.dart';

import 'html_parser.dart';

// ignore: non_constant_identifier_names
String HtmlFormResult(HtmlSNSForm data, String type, String nameInfo) {
  var yes = translate("assesment_page.table_head_yes");
  var no = translate("assesment_page.table_head_no");

  var tTitle = translate("print.header.title");
  var tDate = translate("print.header.date");
  var tWeight = translate("print.header.weight");
  var tHeight = translate("print.header.height");
  var tBmi = translate("print.header.bmi");
  var tQuestions_1 = translate("print.header.questions_1");
  var tQuestions_2 = translate("print.header.questions_2");
  var tQuestions_3 = translate("print.header.questions_3");
  var tQuestions_4 = translate("print.header.questions_4");
  var tResult = translate("print.header.result");
  var tDownload = translate("print.header.download");
  var tWebsite = translate("print.header.website");
  var tScanqr = translate("print.header.scanqr");
  var tFooter = translate("print.header.footer");
  var tAuditor = translate("print.header.auditor");

  var answer = [];

  for (var ans in data.answer) {
    if (ans == yes) {
      answer.add(
        """<th class="tcred">$yes</th> <th>$no</th>""",
      );
    } else {
      answer.add(
        """<th>$yes</th> <th class="tcgreen">$no</th>""",
      );
    }
  }

  var template = """
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$tTitle</title>
    <style>
        body {
            font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            padding: 5px;
            font-size: 12pt;
            background-color: white;
        }
        .fbottom {
            background-color: #E5E7E9;
            font-size: 12pt;
            padding-top: 2em;
            padding-left: 2em;
            padding-right: 0em;
            border-radius: 0.5rem;
            display: grid;
            grid-template-columns: auto auto;
            grid-gap: 10px;
        }
        .center {
            display: block;
            margin-left: auto;
            margin-right: auto;
            width: 50%;
        }
        .sform {
            border: solid 1px grey;
            border-radius: 1rem;
            padding: 1em;
        }
        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 50%;
        }
        td,
        th {
            border: 1px solid #dddddd;
            text-align: center;
            padding: 4px;
        }
        tr:nth-child(even) {
            background-color: #dddddd;
        }
        .tcenter {
            margin-left: auto;
            margin-right: auto;
        }
        .tcred {
            background-color: #F1948A;
        }
        .tcgreen {
            background-color: #58D68D;
        }
    </style>
</head>

<body>
    <img class="left"
        src="https://media.discordapp.net/attachments/1002459006222213120/1028916064345673728/Otsuka-Logo-Colour.png"
        alt="" style="width: 8em;">
    <h3>$tTitle</h3>
    <br />
    <div class="sform">
        <p>$tDate : ${data.date}</p>
        <p>$tWeight : ${data.weight}</p>
        <p>$tHeight : ${data.height}</p>
        <p>$tBmi : ${data.bmi}</p>
        <p>$tQuestions_1</p>
        <!--Result-->
        <table class="tcenter">
           <tr>${answer[0]}</tr>
        </table>
        <!--Result-->
        <p>$tQuestions_2</p>
        <!--Result-->
        <table class="tcenter">
           <tr>${answer[1]}</tr>
        </table>
        <!--Result-->
        <p>$tQuestions_3</p>
        <!--Result-->
        <table class="tcenter">
           <tr>${answer[2]}</tr>
        </table>
        <!--Result-->
        <p>$tQuestions_4</p>
        <!--Result-->
        <table class="tcenter">
           <tr>${answer[3]}</tr>
        </table>
        <!--Result-->
        <h3 style="text-align: left; margin-bottom: 4pt;">$tResult</h3>
        <!--Result-->
        <li style="margin-left: 2em;"> ${data.result_1}</li>
        <li style="margin-left: 2em;"> ${data.result_2}</li>
        <!--Result-->
    </div>
    <hr style=" border-top: 1px dashed grey;">
    <div class="fbottom">
        <div>
            <img class="center"
                src="https://media.discordapp.net/attachments/1002459006222213120/1028916064345673728/Otsuka-Logo-Colour.png"
                alt="" style="width: 7em;">
            <p style="text-align: center;">$tDownload<br>
                <a href="Link">$tWebsite</a>
            </p>
            <p style="text-align: center;">$tScanqr</p>
            <p style="text-align: center;">$tAuditor : $nameInfo</p>
        </div>
        <div>
            <img class="center"
                src="https://media.discordapp.net/attachments/1002459006222213120/1030027604381667349/qrcode.png?width=670&height=670"
                alt="" style="width: 6em;">
                <br/>
            <p style="text-align: center; margin-top: 0%;">$tFooter</p>
        </div>
    </div>
</body>

</html>
""";

  return template;
}
