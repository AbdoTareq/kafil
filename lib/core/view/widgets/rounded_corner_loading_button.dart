import 'package:flutter/material.dart';
import 'package:kafil/core/app_colors.dart';

class RoundedCornerLoadingButton extends StatefulWidget {
  const RoundedCornerLoadingButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.color,
    this.isOutlined = false,
    this.borderColor,
  });

  final Function() onPressed;
  final Color? color;
  final Color? borderColor;
  final Widget child;
  final bool isOutlined;

  @override
  State<RoundedCornerLoadingButton> createState() =>
      _RoundedCornerLoadingButtonState();
}

class _RoundedCornerLoadingButtonState
    extends State<RoundedCornerLoadingButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: widget.isOutlined
            ? ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                  side: const BorderSide(color: kPrimaryColor),
                )))
            : ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    widget.color ?? kPrimaryColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ))),
        onPressed: isLoading
            ? null
            : () async {
                if (mounted) {
                  setState(() {
                    isLoading = true;
                  });
                }
                await widget.onPressed();
                if (mounted) {
                  setState(() {
                    isLoading = false;
                  });
                }
              },
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(color: kBGGreyColor))
            : widget.child);
  }
}
