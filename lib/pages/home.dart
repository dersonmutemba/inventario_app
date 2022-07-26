import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 50),
        children: [
          
        ],
      ),
      bottomNavigationBar: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withAlpha(50),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: IconButton(
                icon: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home_rounded,
                      color: Theme.of(context).primaryColor,
                    ),
                    const SizedBox(width: 5,),
                    Text(
                      'Início',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
                tooltip: 'Início',
                onPressed: () {},
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.search_rounded),
                  ],
                ),
                tooltip: 'Pesquisar',
                onPressed: () {},
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.menu_rounded),
                  ],
                ),
                tooltip: 'Menu',
                onPressed: () {},
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.bar_chart_rounded),
                  ],
                ),
                tooltip: 'Estatísticas',
                onPressed: () {},
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.settings),
                  ],
                ),
                tooltip: 'Definições',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}