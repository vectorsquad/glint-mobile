import 'package:flutter/material.dart';

import '../scripts/validation.dart';

class TextFormFieldC extends StatelessWidget {

  final String prettyName;
  final String paramKey;
  final Map<String, dynamic> params;
  final ValidatorFunc validator;
  final bool obscure;

  const TextFormFieldC(
      this.prettyName,
      this.paramKey,
      this.params,
      this.validator,
      {
        super.key,
        this.obscure = false
      }
      );

  @override
  build(BuildContext context) {

    return TextFormField(
      obscureText: obscure,
      validator: validator,
      onChanged: (text) => params[paramKey] = text,
      decoration: InputDecoration(
        label: Text(prettyName),
        hintText: "Enter $prettyName",
        hintStyle: const TextStyle(
          color: Colors.black26,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black12, // Default border color
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black12, // Default border color
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );


  }

}