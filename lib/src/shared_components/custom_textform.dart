import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final void Function()? onTap;
  final bool readOnly;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final String? hintText;
  const CustomTextForm({
    Key? key,
    this.controller,
    this.label,
    this.onTap,
    this.readOnly = false,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      onTap: onTap,
      validator: validator,
      onSaved: onSaved,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
        hintText: hintText,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
        floatingLabelStyle: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
