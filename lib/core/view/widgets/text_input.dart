import 'package:kafil/export.dart';

// TextField that takes TextEditingController from the main controller(ex:LoginController) to control text from outside to be independent widget
class TextInput extends StatelessWidget {
  const TextInput({
    super.key,
    this.focus,
    required this.controller,
    this.function,
    required this.hint,
    this.spaceAfter = true,
    this.inputType,
    this.maxLength,
    this.registerFocus = false,
    this.isPass = false,
    this.onTap,
    this.disableInput = false,
    this.enabled = true,
    this.borderColor = kPrimaryColor,
    this.validate,
    this.suffixIcon,
    this.prefixIcon,
    this.fontSize,
    this.color,
    this.onChanged,
    this.textColor = kBlack,
    this.showUnderline = true,
    this.hintColor = kBlack,
    this.autofillHints,
    this.minLines,
    this.maxLines,
    this.cursorColor,
  });

  final FocusNode? focus;
  final Function? function;
  final String hint;
  final bool spaceAfter;
  final TextInputType? inputType;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;
  final Function(String value)? onChanged;
  final double? fontSize;
  final bool registerFocus;
  final bool isPass;
  final Function()? onTap;
  final bool disableInput;
  final bool enabled;
  final Color? borderColor;
  final Color? cursorColor;
  final String? Function(String?)? validate;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? color;
  final Color? textColor;
  final Color? hintColor;
  final TextEditingController controller;
  final bool showUnderline;
  final Iterable<String>? autofillHints;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        hint.capitalized.tr().text.gray500.make(),
        8.h.heightBox,
        SizedBox(
          height: 80.r,
          child: TextFormField(
            autofillHints: autofillHints,
            onTapOutside: (event) =>
                FocusManager.instance.primaryFocus!.unfocus(),
            style: TextStyle(color: textColor ?? borderColor),
            controller: controller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              errorStyle: const TextStyle(fontSize: 12, height: 0.8),
              filled: true,
              fillColor: kGreyColor,
              labelStyle: hintColor != null
                  ? TextStyle(color: hintColor, fontSize: fontSize)
                  : borderColor != null
                      ? TextStyle(color: borderColor, fontSize: fontSize)
                      : TextStyle(fontSize: fontSize),
              hintStyle: borderColor != null
                  ? TextStyle(color: borderColor, fontSize: fontSize)
                  : TextStyle(fontSize: fontSize),
              suffixIcon: suffixIcon,
              suffixIconConstraints: const BoxConstraints(
                minWidth: 80,
              ),
              prefixIcon: prefixIcon,
              prefixIconConstraints: const BoxConstraints(
                minWidth: 80,
              ),
              border: InputBorder.none,
              enabledBorder: null,
              focusedBorder: null,
            ),
            onTap: onTap,
            cursorColor: cursorColor ?? borderColor,
            onChanged: onChanged,
            minLines: minLines,
            maxLines: maxLines,
            textInputAction: TextInputAction.next,
            autofocus: registerFocus,
            enableInteractiveSelection: !disableInput,
            enabled: enabled,
            keyboardType: inputType,
            obscureText: isPass,
            inputFormatters: [
              if (inputType == TextInputType.number)
                FilteringTextInputFormatter.allow(RegExp("[-0-9,.]")),
            ],
            readOnly: disableInput,
            maxLength: maxLength,
            onFieldSubmitted: (v) async {
              FocusScope.of(context).requestFocus(focus);
              try {
                await function!();
              } catch (e) {}
            },
            validator: validate,
          ),
        ),
      ],
    );
  }
}
