import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:msa_app/theme/theme.dart';

class MsaAppBar extends AppBar {
  MsaAppBar({
    Key? key,
    String title = "",
    bool isLanguageScreen = false,
    bool haveTutor = false,
    VoidCallback? onPressed,
    VoidCallback? onPressedHint,
    required BuildContext ctx,
  }) : super(
          key: key,
          elevation: 0,
          automaticallyImplyLeading: isLanguageScreen,
          toolbarHeight: isLanguageScreen ? 0 : 70,
          backgroundColor: primaryColor4,
          title: isLanguageScreen
              ? const SizedBox()
              : Center(
                  child: AutoSizeText(
                    title,
                    style: head1,
                    maxLines: 1,
                    minFontSize: 12,
                  ),
                ),
          leading: isLanguageScreen
              ? const SizedBox()
              : IconButton(
                  onPressed: onPressed,
                  icon: const Icon(
                    FeatherIcons.chevronLeft,
                    color: primaryColor,
                  ),
                ),
          actions: [
            haveTutor
                ? isLanguageScreen
                    ? const SizedBox()
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 45,
                          child: MaterialButton(
                            onPressed: onPressedHint,
                            color: primaryColor,
                            textColor: Colors.white,
                            padding: const EdgeInsets.all(16),
                            shape: const CircleBorder(),
                            child: const Icon(
                              Icons.question_mark,
                              size: 15,
                            ),
                          ),
                        ),
                      )
                : const SizedBox(
                    width: 45,
                  )
          ],
        );
}
