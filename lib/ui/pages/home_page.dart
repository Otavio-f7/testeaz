import 'package:flutter/material.dart';
import 'package:testeaz/ui/pages/content_page.dart';
import 'package:testeaz/ui/pages/episodes_page.dart';
import 'package:testeaz/ui/pages/favorites_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  late PageController pc;

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: currentPage);
  }

  setCurrentPage(page){
    setState(() {
      currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pc,
        onPageChanged: setCurrentPage,
        children: const [
          ContentPage(),
          FavoritesPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 1,
        currentIndex: currentPage,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Todos'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favoritos'),
        ],
        onTap: (page){
          pc.animateToPage(
            page, 
            duration: const Duration(milliseconds: 400), 
            curve: Curves.ease);
        },
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      ),
    );
  }
}
