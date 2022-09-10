import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fteam_firebase_login_app/utils/colors.dart';

import '../../data/user_data.dart';

class CustomTextFormFieldComponents extends StatefulWidget {
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final IconData? icon;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  final EdgeInsetsGeometry? contentPadding;
  final FocusNode? focusNode;
  final bool? errorStatus;
  final Function? onTap;
  final void Function(String) onChanged;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? Function(BuildContext,
      {int currentLength, bool isFocused, int maxLength})? buildCounter;

  final int? maxLines;
  final int? maxLength;
  final String? Function(String?)? validator;
  final void Function()? onTapSuffixIcon;
  final String label;
  final String hintText;

  const CustomTextFormFieldComponents({
    super.key,
    this.prefixIcon,
    this.maxLines,
    this.obscureText,
    this.buildCounter,
    this.maxLength,
    this.icon,
    this.keyboardType,
    this.contentPadding,
    this.focusNode,
    this.errorStatus = false,
    this.onTap,
    this.suffixIcon,
    this.onTapSuffixIcon,
    required this.validator,
    required this.label,
    required this.onChanged,
    required this.hintText,
    required this.textInputAction,
    this.inputFormatters,
  });

  @override
  State<CustomTextFormFieldComponents> createState() =>
      _CustomTextFormFieldComponentsState();
}

class _CustomTextFormFieldComponentsState
    extends State<CustomTextFormFieldComponents> {
  final User user =
      User(email: '', password: '', name: '', confirmPassword: '', id: '');

  bool focused = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 0,
        // margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 22),
              child: Text(
                widget.label,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
            TextFormField(
              focusNode: widget.focusNode,
              textCapitalization: TextCapitalization.words, // letra maiuscula
              obscureText: widget.obscureText ?? false, // senha
              cursorColor: Colors.grey,
              style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                  color: Colors.grey),
              keyboardType: TextInputType.name,
              autocorrect: false,
              validator: (value) => widget.validator!(value!),
              onChanged: (value) => widget.onChanged(value),
              textInputAction: widget.textInputAction,
              decoration: InputDecoration(
                contentPadding: widget.contentPadding ??
                    const EdgeInsets.only(
                      top: 16,
                      left: 16,
                      right: 0,
                      bottom: 16,
                    ),
                prefixIcon: Icon(
                  widget.icon,
                  color: ColorsApp.primaryColor,
                  size: 24,
                ),
                suffixIcon: GestureDetector(
                  onTap: widget.onTapSuffixIcon,
                  child: widget.suffixIcon != null
                      ? widget.suffixIcon
                      : const SizedBox(),
                ),
                hintText: widget.hintText,
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                  color: Colors.grey,
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(
                    color: ColorsApp.primaryColor,
                    width: 1.5,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(
                    color: ColorsApp.primaryColor,
                    width: 2,
                  ),
                ),
                errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(
                    color: Colors.red,
                    // color: ColorsApp.primaryColor,
                    width: 1.5,
                  ),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 2,
                  ),
                ),
              ),
              // inputFormatters: widget.inputFormatters, // formatar o texto
            ),
          ],
        ),
      ),
    );
  }
}
