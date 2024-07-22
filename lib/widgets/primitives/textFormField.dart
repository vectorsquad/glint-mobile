part of 'primitives.dart';

class TextFormFieldC extends StatelessWidget {
  final String name;
  final void Function(String) onChanged;
  final ValidatorFunc validator;
  final bool obscure;
  final String? initialValue;

  const TextFormFieldC(
      {this.initialValue,
      required this.name,
      required this.onChanged,
      required this.validator,
      super.key,
      this.obscure = false});

  @override
  build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      obscureText: obscure,
      validator: validator,
      onChanged: onChanged,
      onTapOutside: (ev) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: InputDecoration(
        label: Text(name),
        hintText: "Enter $name",
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
