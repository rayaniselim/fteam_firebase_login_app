import 'package:flutter/material.dart';
import 'package:fteam_firebase_login_app/utils/app_colors.dart';

import '../../../utils/app_font_size.dart';

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
          right: 24,
          bottom: 34,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  ' 😎 Setting up your',
                  style: AppFontSize.appFontSizeTextTitleHeader.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              ' profile',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppFontSize.appFontSizeTextTitleHeader.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Add your profile photo',
                        style:
                            AppFontSize.appFontSizeTextHeaderSubtitle.copyWith(
                          color: AppColors.colorsTextGreyHeader,
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
