import 'package:flutter/material.dart';
import 'package:fteam_firebase_login_app/screens/profile_settings_screen/components/image_profile_components.dart';
import 'package:fteam_firebase_login_app/utils/colors.dart';

import '../components/custom_text_form_field_components.dart';
import 'components/text_header_profile_components.dart';

class ProfileSettingsScreen extends StatefulWidget {
  const ProfileSettingsScreen({Key? key}) : super(key: key);

  @override
  State<ProfileSettingsScreen> createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  final _formKey = GlobalKey<FormState>();

  String _userEmail = '';

  String _userName = '';

  String _password = '';

  String _confirmPassword = '';

  bool isPasswordObscure = true;

  bool isConfirmPasswordObscure = true;

  void _trySubmitForm() {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      debugPrint('Everything looks good!');
      debugPrint(_userEmail);
      debugPrint(_userName);
      debugPrint(_password);
      debugPrint(_confirmPassword);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        // backgroundColor: AppColors.colorsAppBar,
        backgroundColor: Colors.pink,
        elevation: 0,
        toolbarHeight: 90,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_sharp,
            color: AppColors.colorsIconAppBar,
            size: 28,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const TextHeaderProfileComponents(),
            const ImageProfile(),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: AppColors.colorsBackgroundWhite,
              ),
              alignment: Alignment.bottomCenter,
              child: Center(
                child: Card(
                  color: Colors.transparent,
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 25,
                      top: 29,
                      right: 25,
                      bottom: 0,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomTextFormFieldComponents(
                            label: 'Display Name',
                            hintText: '  Enter your name',
                            textInputAction: TextInputAction.next,
                            icon: Icons.person_outline,
                            onChanged: (value) => _userName = value,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'This field is required';
                              }
                              if (value.trim().length < 4) {
                                return 'Username must be at least 4 characters in length';
                              }
                              return null;
                            },
                            //   if (value!.isEmpty ||
                            //       !RegExp(r'ˆ[a-z A-Z]+$').hasMatch(value)) {
                            //     return 'Enter correct name';
                            //   } else {
                            //     return null;
                            //   }
                            // },
                          ),
                          const Padding(
                            padding: EdgeInsets.all(5),
                          ),
                          CustomTextFormFieldComponents(
                            label: 'CPF',
                            hintText: '  CPF',
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            icon: Icons.mode_edit_outline_outlined,
                            onChanged: (value) => _userEmail = value,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Please enter your email address';
                              }

                              if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                /// comeca com string e aceita quantos caracteres necessario S+ em 3 grupos
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                          ),
                          const Padding(
                            padding: EdgeInsets.all(5),
                          ),
                          CustomTextFormFieldComponents(
                            label: 'Telephone',
                            hintText: '  Telephone',
                            textInputAction: TextInputAction.next,
                            icon: Icons.phone,
                            onChanged: (value) => _password = value,
                            obscureText: isPasswordObscure,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'This field is required';
                              }
                              if (value.trim().length < 8) {
                                return 'Password must be at least 8 characters in length';
                              }
                              return null;
                            },
                          ),
                          const Padding(
                            padding: EdgeInsets.all(5),
                          ),
                          CustomTextFormFieldComponents(
                            label: 'Country',
                            hintText: '  Country',
                            textInputAction: TextInputAction.done,
                            icon: Icons.edit_location_outlined,
                            obscureText: isConfirmPasswordObscure,
                            onChanged: (value) => _confirmPassword = value,
                            suffixIcon:
                                // isConfirmPasswordObscure == true
                                //     ? const
                                Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: AppColors.primaryColor,
                              size: 24,
                            ),
                            // : const ListView(),

                            // Icon(
                            //     Icons.visibility_outlined,
                            //     color: AppColors.primaryColor,
                            //     size: 24,
                            //   ),
                            onTapSuffixIcon: () {
                              setState(() {
                                isConfirmPasswordObscure =
                                    !isConfirmPasswordObscure;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This field is required';
                              }

                              if (value != _password) {
                                return 'Confimation password does not match the entered password';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
