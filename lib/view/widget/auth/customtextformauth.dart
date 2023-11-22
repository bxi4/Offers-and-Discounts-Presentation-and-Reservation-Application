// import 'package:flutter/material.dart';

// class CustomTextFormAuth extends StatelessWidget {
//   final String hinttext;
//   final String labeltext;
//   final IconData iconData;
//   final TextEditingController? mycontroller;
//   final String? Function(String?) valid;
//   final bool isNumber;
//   final bool? obscureText;
//   final void Function()? onTapIcon;
//   const CustomTextFormAuth({
//     Key? key,
//     required this.hinttext,
//     required this.labeltext,
//     required this.iconData,
//     required this.valid,
//     required this.isNumber,
//     this.obscureText,
//     this.onTapIcon,
//     required this.mycontroller,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 15),
//       child: TextFormField(
//         //decimal لجل الفواصل والارقام العشرية
//         keyboardType: isNumber
//             ? const TextInputType.numberWithOptions(decimal: true)
//             : TextInputType.text,
//         validator: valid,
//         controller: mycontroller,
//         obscureText: obscureText == null || obscureText == false ? false : true,
//         decoration: InputDecoration(
//             fillColor: Colors.grey.shade200,
//             hintText: hinttext,
//             hintStyle: const TextStyle(
//               fontSize: 14,
//             ),
//             floatingLabelBehavior: FloatingLabelBehavior.always,
//             contentPadding:
//                 const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
//             label: Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 5),
//                 child: Text(labeltext)),
//             suffixIcon: InkWell(onTap: onTapIcon, child: Icon(iconData)),
//             border:
//                 OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hinttext;
  final String labeltext;
  final IconData iconData;
  final TextEditingController? mycontroller;
  final String? Function(String?) valid;
  final bool isNumber;
  final bool? obscureText;
  final void Function()? onTapIcon; //تابع اظهار واخفاء كلمة المرور

  const CustomTextFormAuth(
      {Key? key,
      this.obscureText,
      this.onTapIcon,
      required this.hinttext,
      required this.labeltext,
      required this.iconData,
      required this.mycontroller,
      required this.valid,
      required this.isNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        //decimal لجل الفواصل والارقام العشرية
        keyboardType: isNumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: valid,
        controller: mycontroller,
        obscureText: obscureText == null || obscureText == false
            ? false
            : true, //تابع اظهار واخفاء كلمة المرور
        decoration: InputDecoration(
            hintText: hinttext,
            hintStyle: const TextStyle(fontSize: 14),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 9),
                child: Text(labeltext)),
            suffixIcon: InkWell(child: Icon(iconData), onTap: onTapIcon),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
      ),
    );
  }
}
