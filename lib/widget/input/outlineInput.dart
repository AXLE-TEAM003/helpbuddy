import 'package:flutter/material.dart';

class OutlineInput extends StatefulWidget {
  OutlineInput({Key? key, this.controller, this.maxLines, this.onTap, this.validator})
      : super(key: key);
  VoidCallback? onTap;
  final int? maxLines;
  TextEditingController? controller;
  final String? Function(String value)? validator;

  @override
  State<OutlineInput> createState() => _OutlineInputState();
}

class _OutlineInputState extends State<OutlineInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      autofocus: true,
      obscureText: false,
      onTap: widget.onTap,
      maxLines: widget.maxLines,
      validator: widget.validator != null
          ? (String? value) => widget.validator!(value!)
          : null,
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(
            color: Color(0xff2781E1),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(
            color: Color(0xff2781E1),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(
            color: Color(0xff2781E1),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(
            color: Color(0xff2781E1),
          ),
        ),
      ),
      //  style: FlutterFlowTheme.of(context).bodyText1,
    );
  }
}

class BlackOutlineInput extends StatefulWidget {
  BlackOutlineInput(
      {Key? key,
      this.controller,
      this.maxLines,
      this.label,
      this.suffixWidget,
      this.preffixWidget,
      this.validator,
      this.onTap})
      : super(key: key);
  final int? maxLines;
  VoidCallback? onTap;
  Widget? suffixWidget;
  Widget? preffixWidget;
  String? label;
  TextEditingController? controller;
  final String? Function(String value)? validator;

  @override
  State<BlackOutlineInput> createState() => _BlackOutlineInputState();
}

class _BlackOutlineInputState extends State<BlackOutlineInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      autofocus: true,
      onTap: widget.onTap,
      obscureText: false,

      maxLines: widget.maxLines,
      validator: widget.validator != null
          ? (String? value) => widget.validator!(value!)
          : null,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(
            color: Color(0xffB5B5B5),
          ),
        ),
       // label: Text(widget.label.toString()),
        suffixIcon: widget.suffixWidget ,
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(
            color: Color(0xffB5B5B5),
          ),
        ),
        prefixIcon: widget.preffixWidget,
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(
            color: Color(0xffB5B5B5),
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(
            color: Color(0xffB5B5B5),
          ),
        ),
      ),
      //  style: FlutterFlowTheme.of(context).bodyText1,
    );
  }
}
