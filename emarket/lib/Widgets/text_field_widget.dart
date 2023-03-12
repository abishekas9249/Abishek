import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final bool obsureText;
  final String hintText;
  const TextFieldWidget(
      {super.key,
      required this.controller,
      required this.obsureText,
      required this.title,
      required this.hintText});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late FocusNode focusNode;
  bool isInFocus = false;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();

    focusNode.addListener(() {
      setState(() {
        isInFocus = focusNode.hasFocus ? true : false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            widget.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(boxShadow: [
            isInFocus
                ? BoxShadow(
                    color: Colors.orange.withOpacity(0.3),
                    blurRadius: 2,
                    spreadRadius: 2,
                  )
                : BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 2,
                    spreadRadius: 2,
                  )
          ]),
          child: TextField(
            focusNode: focusNode,
            controller: widget.controller,
            obscureText: widget.obsureText,
            maxLines: 1,
            decoration: InputDecoration(
              hintText: widget.hintText,
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(4)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.orange,
                  width: 1,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
