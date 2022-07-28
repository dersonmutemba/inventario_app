import 'package:flutter/material.dart';
import 'package:inventario/pages/home.dart';
import 'package:inventario/pages/menu.dart';
import 'package:inventario/pages/search.dart';
import 'package:inventario/pages/settings.dart';
import 'package:inventario/pages/stats.dart';

class PagesContainer extends StatefulWidget {
  PagesContainer({Key? key}) : super(key: key);
  
  int _currentPage = 0;

  List<Widget> widgets = [
    const Home(),
    const Search(),
    const Menu(),
    const Stats(),
    const Settings(),
  ];

  @override
  State<StatefulWidget> createState() {
    return _PagesContainerState();
  }
}

class _PagesContainerState extends State<PagesContainer>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      body: widget.widgets[widget._currentPage],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor.withAlpha(50),
        elevation: 1,
        currentIndex: widget._currentPage,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).iconTheme.color,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Início',
            tooltip: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: 'Pesquisar',
            tooltip: 'Pesquisar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_rounded),
            label: 'Menu',
            tooltip: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_rounded),
            label: 'Estatísticas',
            tooltip: 'Estatísticas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Definições',
            tooltip: 'Definições',
          ),
        ],
        onTap: (value) => setState(() {
          widget._currentPage = value;
        }),
      ),
    );
  }
}