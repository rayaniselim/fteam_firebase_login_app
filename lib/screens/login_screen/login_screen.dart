import 'package:flutter/material.dart';

import '../components/custom_text_form_field_components.dart';
import '../../utils/colors.dart';
import 'components/text_header_login_components.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorsBackgroundWhite,
      resizeToAvoidBottomInset: true,
      // appBar: AppBar(
      //   backgroundColor: AppColors.colorsBackgroundWhite,
      //   elevation: 0,
      //   toolbarHeight: 90,
      // ),
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
                              color: AppColors.primaryColor,
                              size: 24,
                            )
                          : const Icon(
                              Icons.visibility_outlined,
                              color: AppColors.primaryColor,
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
                        if (value.trim().length < 8) {
                          return 'Password must be at least 8 characters in length';
                        }
                        return null;
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.all(5),
                    ),
                    const SizedBox(height: 10),
                    const TextHeaderLoginComponents(),
                    const SizedBox(height: 50),
                    Container(
                      width: 255,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/profile');
                        },
                        child: const Text(
                          'Sign Up ',
                          style: TextStyle(color: AppColors.colorsTextWhite),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
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
