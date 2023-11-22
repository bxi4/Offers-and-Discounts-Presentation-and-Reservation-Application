import 'package:flutter/material.dart';

class CustomBodyMyProfilee extends StatelessWidget {
  final String text;
  final double left = 0.0;
  final EdgeInsetsGeometry padding;
  final Function()? onPressed;
  const CustomBodyMyProfilee(
      {Key? key, required this.text, required this.padding, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 160,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 240, 242, 248),
        //borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Padding(
            padding: padding,
            child: MaterialButton(
              onPressed: onPressed,
              color: Color.fromARGB(179, 71, 35, 35),
              elevation: 0.0,
              height: 50,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Text(text,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600)),
            ),
          ),
        ],
      ),
    );
  }
}
