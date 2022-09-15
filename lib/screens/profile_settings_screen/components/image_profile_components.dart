import 'package:flutter/material.dart';
import 'package:fteam_firebase_login_app/utils/app_colors.dart';

class ImageProfile extends StatelessWidget {
  const ImageProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 30,
        ),
        child: Container(
          height: 105,
          width: 105,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(25),
            image: const DecorationImage(
              image: AssetImage('assets/image/image.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
                height: 34,
                width: 34,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 18,
                )),
          ),
        ),
      ),
    );
  }
}
