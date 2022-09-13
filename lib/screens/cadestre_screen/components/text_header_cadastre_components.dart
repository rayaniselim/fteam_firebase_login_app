import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fteam_firebase_login_app/utils/colors.dart';

class TextHeaderCadestreComponents extends StatefulWidget {
  const TextHeaderCadestreComponents({super.key});

  @override
  State<TextHeaderCadestreComponents> createState() =>
      _TextHeaderCadestreComponentsState();
}

class _TextHeaderCadestreComponentsState
    extends State<TextHeaderCadestreComponents> {
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Text(
                      ' 👋 Hello,',
                      maxLines: 2,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Are you new here?',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: 'if you have an account /',
                            style: TextStyle(
                              color: AppColors.colorsTextGreyHeader,
                              fontSize: 17,
                            ),
                          ),
                          TextSpan(
                            text: 'Login',
                            style: const TextStyle(
                              fontSize: 17,
                              color: AppColors.colorsTextLogin,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => {
                                    Navigator.pushNamed(context, '/login'),
                                  },
                          ),
                        ],
                      ),
                    ),

                    // const Text(
                    //   'if you have an account /',
                    //   overflow: TextOverflow.ellipsis,
                    //   style: TextStyle(
                    //     color: AppColors.colorsTextGreyHeader,
                    //     fontSize: 17,
                    //   ),
                    //   textAlign: TextAlign.start,
                    // ),
                    // TextButton(
                    //   style: const ButtonStyle(
                    //     alignment: Alignment.centerLeft,
                    //   ),
                    //   onPressed: () {
                    //     // pagina de criar conta
                    //   },
                    //   child: const Text(
                    //     'Login',
                    //     style: TextStyle(
                    //       fontSize: 17,
                    //       color: AppColors.colorsTextLogin,
                    //     ),
                    // textAlign: TextAlign.start,
                    // ),
                    // ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
