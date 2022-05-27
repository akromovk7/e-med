import 'package:flutter/material.dart';
import 'package:med_app/core/constants/color_const.dart';

class MyTextField {
  static textField({
    required String text,
    IconButton? iconButton,
    required TextEditingController controller,
    IconButton? phoneNumber,
    bool read = false,
    var onChanged,
    VoidCallback? onTap,
    FormFieldValidator<String>? validator,
    bool isShown = false
  }) {
    return TextFormField(
        controller: controller,
        readOnly: read,
        onChanged: onChanged,
        onTap: onTap,
        obscureText: isShown,
        decoration: InputDecoration(
          hintText: text,
          hintStyle: const TextStyle(color: Colors.grey),
          suffixIcon: iconButton,
          prefixIcon: phoneNumber,
          fillColor: Colors.white,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(color: ConsColors.kPrimaryColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide:  BorderSide(color: ConsColors.kBlack),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide:  BorderSide(color: ConsColors.kBlack),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(color: ConsColors.kPrimaryColor),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        validator: validator);
  }
}