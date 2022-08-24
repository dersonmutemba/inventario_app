import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final String text, image;
  final Function() onClick;
  const MenuButton({Key? key, required this.text, required this.image, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(25),
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(10),
        ),
        color: Theme.of(context).cardColor,
        image: DecorationImage(
          image: AssetImage(image),
          alignment: Alignment.center,
          fit: BoxFit.fitWidth,
          opacity: 0.4,
          onError: (Object exception, StackTrace? stackTrace) {
            debugPrint('${exception.toString()}\n${stackTrace.toString()}');
          }
        ),
      ),
      height: 100,
      child: TextButton(
        onPressed: () {
          onClick();
        },
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}