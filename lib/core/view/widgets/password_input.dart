import '../../../export.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({
    super.key,
    required this.controller,
    required this.hint,
    this.validate,
    this.isUnderline = true,
    this.borderColor,
  });

  final TextEditingController controller;
  final String hint;
  final bool isUnderline;
  final String? Function(String?)? validate;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return TextInput(
      borderColor: borderColor ?? kPrimaryColor,
      controller: controller,
      autofillHints: const [AutofillHints.password],
      hint: hint,
      showUnderline: isUnderline,
      prefixIcon: Icon(Icons.lock, color: borderColor),
      isPass: true,
      maxLines: 1,
      validate: validate ?? (value) => value!.length > 5 ? null : passWar,
    );
  }
}
