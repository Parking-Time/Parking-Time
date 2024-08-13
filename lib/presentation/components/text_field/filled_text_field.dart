import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parking_time/presentation/resources/styles/colors.dart';

import '../../resources/styles/shape.dart';

class FilledTextField extends StatefulWidget {
  FilledTextField({
    super.key,
    required this.hintText,
    TextEditingController? controller,
    FocusNode? focusNode,
    required this.onChanged,
  }) :  controller = controller ?? TextEditingController(),
        focusNode = focusNode ?? FocusNode();

  final String hintText;

  final TextEditingController controller;

  final FocusNode focusNode;

  final void Function(String text) onChanged;

  @override
  State<FilledTextField> createState() => _FilledTextFieldState();
}

class _FilledTextFieldState extends State<FilledTextField> {

  void updateWidget() => setState(() {});

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => widget.focusNode.addListener(updateWidget));
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(updateWidget);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasFocus = widget.focusNode.hasFocus;
    final hasText = widget.controller.value.text.isNotEmpty;

    return TextField(
      style: Theme.of(context).textTheme.bodyMedium,
      controller: widget.controller,
      focusNode: widget.focusNode,
      cursorColor: kBlue1,
      cursorWidth: 1,
      decoration: InputDecoration(
        label: Padding(
          padding: EdgeInsets.only(bottom: hasFocus || hasText ? 30 : 0),
          child: Text(
            widget.hintText,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: hasFocus ? kBlue1 : kGray2,
            ),
          ),
        ),
        filled: true,
        fillColor: hasFocus ? kGray3 : kGray4,
        focusedBorder: const OutlineInputBorder(
          borderRadius: kAllRound7,
          borderSide: BorderSide(width: 0, color: kGray3),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: kAllRound7,
          borderSide: BorderSide(width: 0, color: kGray4),
        ),
      ),
      //onChanged: widget.onChanged,
    );
  }
}
