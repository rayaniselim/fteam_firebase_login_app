import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fteam_firebase_login_app/utils/colors.dart';

class TextHeaderLoginComponents extends StatefulWidget {
  const TextHeaderLoginComponents({super.key});

  @override
  State<TextHeaderLoginComponents> createState() =>
      _TextHeaderLoginComponentsState();
}

class _TextHeaderLoginComponentsState extends State<TextHeaderLoginComponents> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 0,
        top: 8,
        right: 0,
        bottom: 4,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                  text: "if you don't have an account /",
                  style: TextStyle(
                    color: AppColors.colorsTextGreyHeader,
                    fontSize: 17,
                  ),
                ),
                TextSpan(
                  text: ' Create',
                  style: const TextStyle(
                    fontSize: 17,
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
      ),
    );
  }
}
