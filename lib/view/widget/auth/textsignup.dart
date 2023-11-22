import 'package:flutter/material.dart';

class CustomTestSignUpOrSignIn extends StatelessWidget {
  final String textone;
  final String texttwo;
  final void Function()? onTap;
  const CustomTestSignUpOrSignIn(
      {Key? key, required this.textone, required this.texttwo, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textone,
          style: const TextStyle(color: Colors.grey),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            texttwo,
            style:
                TextStyle(color: Colors.blue[200], fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
