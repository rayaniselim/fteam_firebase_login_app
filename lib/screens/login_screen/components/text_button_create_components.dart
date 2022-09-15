import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fteam_firebase_login_app/utils/app_colors.dart';

import '../../../utils/app_font_size.dart';

class TextButtonCreateComponents extends StatefulWidget {
  const TextButtonCreateComponents({super.key});

  @override
  State<TextButtonCreateComponents> createState() =>
      _TextButtonCreateComponentsState();
}

class _TextButtonCreateComponentsState
    extends State<TextButtonCreateComponents> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "if you don't have an account /",
                style: AppFontSize.appFontSizeTextLogin.copyWith(
                  color: AppColors.colorsTextGreyHeader,
                ),
              ),
              TextSpan(
                text: ' Create',
                style: AppFontSize.appFontSizeTextLogin.copyWith(
                  color: AppColors.colorsTextLogin,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, '/cadestre');
                  },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
