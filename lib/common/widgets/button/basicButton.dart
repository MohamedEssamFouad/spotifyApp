import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_app/core/themes/appColor.dart';

class BasicButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title ;
  final double? height;
  const BasicButton({
    super.key, required this.onPressed, required this.title,  this.height
  });
  // ({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed,
style: ElevatedButton.styleFrom(
  minimumSize:  Size.fromHeight(height ?? 80)
),
    child: Text(
      style: TextStyle(
        color: AppcColor.lightbackground,
      ),
      title,
    ),);
  }
}
