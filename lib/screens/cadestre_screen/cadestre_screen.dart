import 'package:flutter/material.dart';

import '../components/custom_text_form_field_components.dart';
import '../../utils/colors.dart';
import '../components/text_header_components.dart';

class CadestreScreen extends StatefulWidget {
  const CadestreScreen({super.key});

  @override
  State<CadestreScreen> createState() => _CadestreScreenState();
}

class _CadestreScreenState extends State<CadestreScreen> {
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
      backgroundColor: Colors.grey[100],
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        scrolledUnderElevation: 10,
        leading: InkWell(
          onTap: () {
            // Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_sharp,
            color: Colors.grey[700],
            size: 28,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const TextHeaderComponents(),
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.white,
              ),
              constraints: const BoxConstraints(
                maxHeight: double.infinity,
                minWidth: 320,
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
                            label: 'Full Name',
                            hintText: '  Full Name',
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
                          ),
                          const Padding(
                            padding: EdgeInsets.all(5),
                          ),
                          CustomTextFormFieldComponents(
                            label: 'Email',
                            hintText: '  Email',
                            textInputAction: TextInputAction.next,
                            icon: Icons.email_outlined,
                            onChanged: (value) => _userEmail = value,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Please enter your email address';
                              }

                              if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
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
                                    color: ColorsApp.primaryColor,
                                    size: 24,
                                  )
                                : const Icon(
                                    Icons.visibility_outlined,
                                    color: ColorsApp.primaryColor,
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
                          CustomTextFormFieldComponents(
                            label: 'Confirm Password',
                            hintText: '  Confirm Password',
                            textInputAction: TextInputAction.done, //go
                            icon: Icons.lock_outline,
                            obscureText: isConfirmPasswordObscure,
                            onChanged: (value) => _confirmPassword = value,
                            suffixIcon: isConfirmPasswordObscure == true
                                ? const Icon(
                                    Icons.visibility_off_outlined,
                                    color: ColorsApp.primaryColor,
                                    size: 24,
                                  )
                                : const Icon(
                                    Icons.visibility_outlined,
                                    color: ColorsApp.primaryColor,
                                    size: 24,
                                  ),
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
                          const SizedBox(height: 50),
                          Container(
                            width: 255,
                            decoration: BoxDecoration(
                              color: ColorsApp.primaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            alignment: Alignment.center,
                            child: TextButton(
                              onPressed: _trySubmitForm,
                              child: const Text(
                                'Sign Up ',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // ),
          ],
        ),
      ),
    );
  }
}
