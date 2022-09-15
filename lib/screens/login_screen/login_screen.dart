import 'package:flutter/material.dart';

import '../../utils/app_font_size.dart';
import '../components/custom_text_form_field_components.dart';
import '../../utils/app_colors.dart';
import 'components/forgot_my_password_components.dart';
import 'components/text_button_create_components.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  String _userEmail = '';
  String _password = '';

  bool isPasswordObscure = true;

  void _trySubmitForm() {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      debugPrint('Everything looks good!');
      debugPrint(_userEmail);
      debugPrint(_password);
      Navigator.pushNamed(context, '/profile');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorsBackgroundWhite,
      resizeToAvoidBottomInset: true,
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
                    const Padding(
                      padding: EdgeInsets.all(5),
                    ),
                    CustomTextFormFieldComponents(
                      label: 'Email',
                      hintText: '  Email',
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      icon: Icons.email_outlined,
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
                      label: 'Password',
                      hintText: '  Password',
                      textInputAction: TextInputAction.next,
                      icon: Icons.lock_outline,
                      suffixIcon: isPasswordObscure == true
                          ? const Icon(
                              Icons.visibility_off_outlined,
                              color: AppColors.colorsIconGrey,
                              size: 24,
                            )
                          : const Icon(
                              Icons.visibility_outlined,
                              color: AppColors.colorsIconGrey,
                              size: 24,
                            ),
                      onTapSuffixIcon: () {
                        setState(() {
                          isPasswordObscure = !isPasswordObscure;
                        });
                      },
                      onChanged: (value) => _password = value,
                      obscureText: isPasswordObscure,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'This field is required';
                        }
                        if (value.trim().length < 6) {
                          return 'Password must be at least 6 characters in length';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 5),
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 0,
                      ),
                      child: ForgotMyPasswordComponents(),
                    ),
                    const SizedBox(height: 40),
                    InkWell(
                      onTap: () {
                        _trySubmitForm();
                        // Navigator.pushNamed(context, '/profile');
                      },
                      child: Container(
                        width: 330,
                        height: 50,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Sign Up ',
                          style: AppFontSize.appFontSizeTextButton.copyWith(
                            color: AppColors.colorsTextWhite,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const TextButtonCreateComponents(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
