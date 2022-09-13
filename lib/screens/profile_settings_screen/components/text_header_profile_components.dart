import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fteam_firebase_login_app/utils/colors.dart';

class TextHeaderProfileComponents extends StatefulWidget {
  const TextHeaderProfileComponents({super.key});

  @override
  State<TextHeaderProfileComponents> createState() =>
      _TextHeaderProfileComponentsState();
}

class _TextHeaderProfileComponentsState
    extends State<TextHeaderProfileComponents> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.colorsBackgroundGrey,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 24,
          top: 8,
          right: 24,
          bottom: 34,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Text(
                  ' 😎 Setting up your',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            const SizedBox(
              height: 0,
            ),
            const Text(
              ' profile',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 20),
            Row(
              children: const [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Add your profile photo',
                        style: TextStyle(
                          color: AppColors.colorsTextGreyHeader,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
