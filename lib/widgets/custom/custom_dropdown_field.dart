import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/fonts.dart';
import '../../constants/values.dart';

class CustomDropdownFormField<T> extends StatelessWidget {
  final String? labelText;
  final IconData? prefixIconData;
  final List<DropdownMenuItem<T>> items;
  final T? value;
  final void Function(T?)? onChanged;
  final String? Function(T?)? validator;
  final bool autofocus;

  const CustomDropdownFormField({
    Key? key,
    required this.labelText,
    required this.prefixIconData,
    required this.items,
    required this.value,
    required this.onChanged,
    this.validator,
    this.autofocus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      items: items,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(0.0),
        labelText: labelText,
        labelStyle: const TextStyle(
          color: ColorsManager.primaryColor,
          fontSize: FontSize.textFontSize,
          fontWeight: FontWeight.w400,
        ),
        prefixIcon: prefixIconData != null
            ? Icon(
                prefixIconData,
                size: 20,
                color: ColorsManager.lightPrimaryColor,
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorsManager.primaryColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(RadiusManager.fieldRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: ColorsManager.primaryColor, width: 1.5),
          borderRadius: BorderRadius.circular(RadiusManager.fieldRadius),
        ),
        focusColor: ColorsManager.primaryColor,
        errorStyle: const TextStyle(
          color: Colors.red,
          fontSize: FontSize.subTitleFontSize,
        ),
      ),
      validator: validator,
      autofocus: autofocus,
      style: const TextStyle(
        fontFamily: 'Poppins',
        color: ColorsManager.primaryColor,
        fontSize: FontSize.textFontSize + 2,
      ),
      icon: const Icon(
        Icons.arrow_drop_down,
        color: ColorsManager.primaryColor,
      ),
    );
  }
}
