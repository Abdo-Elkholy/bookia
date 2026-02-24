import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatefulWidget {
  final TextInputType textInputType;

  /// to use with confirm password
  final bool hide;
  final String title;

  const AppTextFormField({
    super.key,
    this.textInputType = TextInputType.text,
    this.hide = true,
    required this.title,
  });

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  late bool visibility = isPassword(widget.textInputType);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: visibility,
      keyboardType: widget.textInputType,
      cursorColor: AppColors.primaryColor,
      onTapOutside: (v) {
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
        suffixIcon: widget.hide && isPassword(widget.textInputType)
            ? IconButton(
                onPressed: () {
                  setState(() {
                    visibility = !visibility;
                  });
                },
                icon: visibility
                    ? Icon(Icons.visibility_off, color: AppColors.darkGray)
                    : Icon(Icons.visibility, color: AppColors.darkGray),
              )
            : null,
        hint: Text(
          widget.title,
          style: AppTextStyle.text15Regular.copyWith(color: Color(0xff8391A1)),
        ),
        fillColor: AppColors.textFormFieldColor,
        filled: true,
        border: OutlineInputBorder(borderSide: BorderSide()),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.borderColor),
        ),
      ),
    );
  }
}

bool isPassword(TextInputType input) {
  return input == TextInputType.visiblePassword;
}
