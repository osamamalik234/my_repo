import 'package:flutter/material.dart';


class MyButton extends StatelessWidget {
  final String text1;
  final Color color;
  final VoidCallback press;
  const MyButton({Key? key , required this.text1 , this.color = Colors.grey, required this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7 , vertical: 7),
      child: InkWell(
        onTap: press,
        child: Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
             color: color,
             shape: BoxShape.circle,
          ),
          child: Center(child: Text(text1 , style: TextStyle(fontSize: 20),)),
        ),
      ),
    );
  }
}
