import 'package:flutter/material.dart';

class MsaHintAlert extends AlertDialog {
  const MsaHintAlert({Key? key}) : super(key: key);
}


//  onPressedHint: () => showDialog<String>(
//           //FIXME PART GO
//           context: context,
//           builder: (BuildContext context) => AlertDialog(
//             title: const Text('AlertDialog Title'),
//             content: const Text('AlertDialog description'),
//             actions: <Widget>[
//               TextButton(
//                 onPressed: () => Navigator.pop(context, 'Cancel'),
//                 child: const Text('Cancel'),
//               ),
//               TextButton(
//                 onPressed: () => Navigator.pop(context, 'OK'),
//                 child: const Text('OK'),
//               ),
//             ],
//           ),
//         ),