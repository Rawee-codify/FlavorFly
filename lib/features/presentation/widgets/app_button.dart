import 'package:flutter/material.dart';
import '../../../core/utils/enums.dart';

class AppButton extends StatefulWidget {
  final String buttonText;
  final Function onTapButton;
  final double width;
  final double radius;
  final double fontSize;
  final FontWeight fontWeight;
  final ButtonType buttonType;
  final Widget? prefixIcon;
  Color? buttonColor;
  Color? textColor;
  final double verticalPadding;

  AppButton({
    super.key,
    required this.buttonText,
    required this.onTapButton,
    this.width = 0,
    this.radius = 0,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w600,
    this.prefixIcon,
    this.buttonColor,
    this.textColor,
    this.buttonType = ButtonType.ENABLED,
    this.verticalPadding = 14,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: widget.verticalPadding),
        width: widget.width == 0 ? double.infinity : widget.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
          color: widget.buttonType == ButtonType.ENABLED
              ? widget.buttonColor == null
                  ? Theme.of(context).inputDecorationTheme.fillColor
                  : widget.buttonColor!
              : widget.buttonColor == null
                  ? Theme.of(context).primaryColor.withAlpha(150)
                  : widget.buttonColor!.withAlpha(150),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget.prefixIcon ?? const SizedBox.shrink(),
              widget.prefixIcon != null
                  ? const SizedBox(
                      width: 5,
                    )
                  : const SizedBox.shrink(),
              Expanded(
                child: Text(
                  widget.buttonText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: widget.buttonType == ButtonType.ENABLED
                        ? widget.textColor == null
                            ? Theme.of(context).textTheme.labelLarge?.color
                            : widget.textColor!
                        : widget.textColor == null
                            ? Colors.black
                            : widget.textColor!.withAlpha(150),
                    fontWeight:
                        Theme.of(context).textTheme.labelLarge?.fontWeight ??
                            widget.fontWeight,
                    fontSize:
                        Theme.of(context).textTheme.labelLarge?.fontSize ??
                            widget.fontSize,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        if (widget.buttonType == ButtonType.ENABLED) {
          widget.onTapButton();
        }
      },
    );
  }
}
