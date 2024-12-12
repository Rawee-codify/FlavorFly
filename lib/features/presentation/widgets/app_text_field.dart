import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatefulWidget {
  final String? hintText;
  final String? errorText;
  final Color? textColor;
  final Color? hintColor;
  final Color? borderColor;
  final double? width;
  final Widget? suffix;
  final Widget? prefix;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChange;
  final Function()? onEditingComplete;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool obscureText;
  final bool enable;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final FocusNode? focusNode;
  final Color? bgColor;
  final void Function()? removeButton;
  final bool onlyNumbers;
  final bool noErrorText;
  final bool dropDown;
  final double? radius;
  final Function()? onTap;

  const AppTextField({
    Key? key,
    this.hintText,
    this.textColor,
    this.width,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.keyboardType,
    this.maxLength,
    this.suffix,
    this.enable = true,
    this.maxLines,
    this.minLines,
    this.bgColor,
    this.onChange,
    this.removeButton,
    this.errorText,
    this.prefix,
    this.focusNode,
    this.hintColor,
    this.onEditingComplete,
    this.textInputAction,
    this.onlyNumbers = false,
    this.noErrorText = false,
    this.dropDown = false,
    this.radius,
    this.onTap,
    this.borderColor,
  }) : super(key: key);

  @override
  AppTextFieldState createState() => AppTextFieldState();
}

class AppTextFieldState extends State<AppTextField> {
  late FocusNode focusNode;

  @override
  void initState() {
    if (widget.focusNode == null) {
      focusNode = FocusNode();
    } else {
      focusNode = widget.focusNode!;
    }

    focusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      alignment: Alignment.bottomCenter,
      child: TextFormField(
        obscureText: widget.obscureText,
        enabled: widget.enable,
        keyboardType: widget.keyboardType ?? TextInputType.text,
        controller: widget.controller,
        focusNode: focusNode,
        inputFormatters:
            widget.onlyNumbers ? [FilteringTextInputFormatter.digitsOnly] : [],
        onEditingComplete: widget.onEditingComplete,
        textInputAction: widget.textInputAction,
        onChanged: widget.onChange ??
            (value) {
              setState(() {});
            },
        decoration: InputDecoration(
          isDense: true,
          errorText: widget.errorText,
          errorStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontSize: widget.noErrorText ? 0 : 15,
                height: widget.noErrorText ? 0 : null,
                color: Colors.red,
              ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).inputDecorationTheme.fillColor!,
                width: 1),
            borderRadius: BorderRadius.circular(widget.radius ?? 6),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
                color: widget.borderColor ??
                    Theme.of(context).inputDecorationTheme.fillColor!,
                width: 1),
            borderRadius: BorderRadius.circular(widget.radius ?? 6),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: widget.borderColor ??
                    Theme.of(context).inputDecorationTheme.fillColor!,
                width: 1),
            borderRadius: BorderRadius.circular(widget.radius ?? 6),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).inputDecorationTheme.focusColor!,
                width: 1),
            borderRadius: BorderRadius.circular(widget.radius ?? 6),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.redAccent, width: 1),
            borderRadius: BorderRadius.circular(widget.radius ?? 6),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.redAccent, width: 1),
            borderRadius: BorderRadius.circular(widget.radius ?? 6),
          ),
          hintText: widget.hintText,
          filled: widget.bgColor != null
              ? true
              : (widget.enable ? false : (!widget.dropDown)),
          suffixIcon: (widget.removeButton != null)
              ? (widget.controller!.text.isNotEmpty
                  ? InkWell(
                      onTap: widget.removeButton!,
                    )
                  : widget.suffix == null
                      ? null
                      : Container(
                          child: widget.suffix,
                        ))
              : widget.suffix == null
                  ? null
                  : Container(
                      child: widget.suffix,
                    ),
          prefixIcon: widget.prefix,
          hintStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: widget.hintColor ?? Colors.grey,
                fontWeight: FontWeight.w500,
              ),
          counterText: "",
          fillColor: widget.bgColor ?? (widget.enable ? null : Colors.grey),
          contentPadding: EdgeInsets.symmetric(
              vertical: (widget.minLines ?? 1) == 1 ? 8 : 8, horizontal: 8),
        ),
        cursorColor: Colors.blue,
        maxLength: widget.maxLength,
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: !widget.enable
                  ? (widget.textColor ?? Colors.grey)
                  : focusNode.hasFocus
                      ? (widget.textColor ?? Colors.grey)
                      : Colors.grey,
              fontWeight: FontWeight.w500,
            ),
        maxLines: widget.maxLines ?? 1,
        minLines: widget.minLines ?? 1,
        validator: widget.validator,
        onTap: widget.onTap,
      ),
    );
  }
}
