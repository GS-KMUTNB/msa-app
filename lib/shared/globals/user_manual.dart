import 'package:flutter/material.dart';
import 'package:msa_app/models/image_user_manual.dart';
import 'package:msa_app/theme/theme.dart';

class UserManual extends Container {
  UserManual({
    required BuildContext context,
    required int indexImageList,
    required int indexText,
    Key? key,
  }) : super(
          key: key,
          child: SingleChildScrollView(
            child: AlertDialog(
              actionsAlignment: MainAxisAlignment.center,
              key: key,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              backgroundColor: primaryColor1,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  msaSizeBox(width: 40),
                  const Text(
                    "User Manual",
                    style: TextStyle(
                        color: whiteColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 24.0,
                      ))
                ],
              ),
              content: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Container(
                      height: 570,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                imageManual[indexImageList].image,
                              ),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  msaSizeBox(height: 20),
                  Text(imageManual[indexImageList].textContent,
                      style: const TextStyle(color: whiteColor))
                ],
              ),
            ),
          ),
        );
}
