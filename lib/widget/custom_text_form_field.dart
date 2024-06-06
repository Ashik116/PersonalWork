import 'package:flutter/material.dart';

class CustomTexFormField extends StatelessWidget {
  CustomTexFormField({
    Key? key,
    this.alignment,
    this.width,
    this.scroolPadding,
    this.controller,
    this.focusNode,
    this.autofocus = false,
    this.textStyle,
    this.validator,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLine,
    this.hintText,
    this.borderDecoration,
    this.contentPadding,
    this.fillColor,
    this.filled = true,
    this.hintStyle,
    this.obscureText = false,
    this.prefixConstraints,
    this.suffix,
    this.prefix,
    this.suffixConstraints,
  }) : super(
          key: key,
        );
  final Alignment? alignment;
  final double? width;
  final TextEditingController? scroolPadding;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? autofocus;
  final TextStyle? textStyle;
  final bool? obscureText;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final int? maxLine;
  final String? hintText;
  final TextStyle? hintStyle;
  final BoxConstraints? prefixConstraints;
  final Widget? suffix;
  final Widget? prefix;
  final BoxConstraints? suffixConstraints;
  final EdgeInsets? contentPadding;
  final InputBorder? borderDecoration;
  final Color? fillColor;
  final bool? filled;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: textFormFieldWidget(context))
        : textFormFieldWidget(context);
  }

  Widget textFormFieldWidget(BuildContext context) => SizedBox(
        width: width ?? double.maxFinite,
        child: TextFormField(
          scrollPadding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          controller: controller,
          focusNode: focusNode,
          onTapOutside: (event) {
            if (focusNode != null) {
              focusNode?.unfocus();
            } else {
              FocusManager.instance.primaryFocus?.unfocus();
            }
          },
          autofocus: autofocus!,
          //style: textStyle??,
          obscureText: obscureText!,
          textInputAction: textInputAction,
          keyboardType: textInputType,
          maxLines: maxLine ?? 1,
          decoration: decoration,
          validator: validator,
        ),
      );
  InputDecoration get decoration => InputDecoration(
        hintText: hintText ?? "",
        // hintStyle: hintStyle
        prefixIcon: prefix,
        prefixIconConstraints: prefixConstraints,
        suffix: suffix,
        suffixIconConstraints: suffixConstraints,
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.only(
              top: 20,
              right: 20,
              left: 20,
            ),
        fillColor: fillColor,
        filled: filled,
        border: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
        enabledBorder: borderDecoration ??
            OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
        focusedBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
      );
}
