import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AvatarElement extends StatefulWidget {
  final String base64String;
  final Size size;
  final double borderRadius;
  VoidCallback? onClick;

  AvatarElement({
    super.key, 
    required this.base64String, 
    required this.size, 
    required this.borderRadius, 
    this.onClick
  });

  @override
  State<AvatarElement> createState() => _AvatarElementState();
}

class _AvatarElementState extends State<AvatarElement> {
  late Uint8List byteArray;

  @override
  void initState() {
    super.initState();
    byteArray = base64Decode(widget.base64String);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector (
      onTap: widget.onClick,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        child: Image.memory(
          byteArray,
          width: widget.size.width,
          height: widget.size.height,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}