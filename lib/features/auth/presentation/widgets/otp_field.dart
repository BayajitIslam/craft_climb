import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class OtpField extends StatefulWidget {
  final int otpLength;
  final void Function(String otp) onCompleted;

  const OtpField({super.key, this.otpLength = 5, required this.onCompleted});

  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(
      widget.otpLength,
      (_) => TextEditingController(),
    );
    focusNodes = List.generate(widget.otpLength, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (var c in controllers) {
      c.dispose();
    }
    for (var f in focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void onChanged(String value, int index) {
    // move forward
    if (value.isNotEmpty && index < widget.otpLength - 1) {
      focusNodes[index + 1].requestFocus();
    }

    // move backward on delete
    if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }

    // check if all filled
    final otp = controllers.map((c) => c.text).join();
    if (otp.length == widget.otpLength) {
      widget.onCompleted(otp);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        widget.otpLength,
        (index) => SizedBox(
          height: 46,
          width: 56,
          child: TextFormField(
            controller: controllers[index],
            focusNode: focusNodes[index],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,
            style: AppTextStyle.s16w4i(fontWeight: FontWeight.w600),
            decoration: InputDecoration(
              counterText: '', // hide maxLength counter
              hintText: '–',
              hintStyle: AppTextStyle.s16w4i(color: AppPallete.bodyText),
              filled: true,
              fillColor: AppPallete.primary,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: AppPallete.accent10),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: AppPallete.accent10),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: AppPallete.accent, width: 1.5),
              ),
            ),
            onChanged: (value) => onChanged(value, index),
          ),
        ),
      ),
    );
  }
}
