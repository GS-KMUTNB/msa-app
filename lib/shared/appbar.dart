import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:msa_app/theme/theme.dart';

class MsaAppBar extends AppBar {
  MsaAppBar({
    Key? key,
    String title = "",
    bool isLanguageScreen = false,
    VoidCallback? onPressed,
    required BuildContext ctx,
  }) : super(
          key: key,
          elevation: 0,
          automaticallyImplyLeading: isLanguageScreen,
          toolbarHeight: isLanguageScreen ? 0 : 70,
          backgroundColor: Colors.transparent,
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
                  icon: const Icon(FeatherIcons.chevronLeft),
                ),
          actions: [
            isLanguageScreen
                ? const SizedBox()
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 50,
                      child: MaterialButton(
                        onPressed: () {},
                        color: Colors.blue,
                        textColor: Colors.white,
                        child: Icon(
                          Icons.camera_alt,
                          size: 15,
                        ),
                        padding: EdgeInsets.all(16),
                        shape: CircleBorder(),
                      ),
                    ),
                  )
          ],
        );
}
