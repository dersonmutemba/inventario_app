import 'package:flutter/material.dart';
import 'package:inventario/widgets/menubutton.dart';

class Menu extends StatelessWidget{
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        children: [
          MenuButton(
            image: 'assets/images/pattern1.jpeg',
            text: 'Gerir Produtos',
            onClick: () {
              debugPrint('Button clicked!');
            },
          ),
          MenuButton(
            image: 'assets/images/pattern2.jpeg',
            text: 'Gerir Armazéns',
            onClick: () => debugPrint('Button clicked!'),
          ),
        ],
      ),
    );
  }
}