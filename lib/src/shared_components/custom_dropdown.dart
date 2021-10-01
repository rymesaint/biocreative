import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String? label;
  final List<DropdownMenuItem<dynamic>> items;
  final void Function(dynamic)? onChanged;
  final String? Function(dynamic)? validator;
  const CustomDropdown({
    Key? key,
    required this.items,
    this.label,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
        floatingLabelStyle: const TextStyle(
          color: Colors.black,
        ),
      ),
      items: items,
    );
  }
}
