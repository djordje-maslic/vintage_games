import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vintage_games/view_games.dart';

void main() => runApp(MaterialApp(
      theme: _themeData(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Skill Builder',
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController controller = TextEditingController();
  List<BrucesGame> list = [];

  @override
  void initState() {
    list.addAll(listOfGames);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: CustomScrollView(
          slivers: [
            DefaultTabController(
              length: 1,
              child: SliverAppBar(
                centerTitle: true,
                title: Text(
                  "Bruce’s Retro Games",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize:
                          MediaQuery.of(context).size.shortestSide * 0.08),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    "https:\/\/www.freetogame.com\/g\/306\/thumbnail.jpg",loadingBuilder: (context,child,chunk)=> child,
                    fit: BoxFit.fill,
                  ),
                ),
                expandedHeight: 250,
                bottom: TabBar(
                  tabs: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white54,
                          border: Border.all(),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                              controller: controller,
                              onChanged: (value) {
                                setState(() {
                                  list = searchGames(value, listOfGames);
                                });
                              },
                              decoration: const InputDecoration(
                                  hintText: 'search games',
                                  icon: Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ))),
                        ),
                      ),
                    )
                  ],
                ),
                floating: true,
              ),
            ),
            BuildImages(
              listOfGamesNew: list,
            ),
          ],
        ),
      ),
    );
  }
}

class BuildImages extends StatelessWidget {
  final List<BrucesGame> listOfGamesNew;
  const BuildImages({required this.listOfGamesNew, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            // mainAxisExtent: MediaQuery.of(context).size.height * 0.25 - 20
          ),
          itemCount: listOfGamesNew.length,
          primary: false,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                children: [
                  Text(listOfGamesNew[index].name),
                  Placeholder(
                    fallbackHeight:
                        MediaQuery.of(context).size.height * 0.20 - 7,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

ThemeData _themeData() {
  return ThemeData.light().copyWith(
    indicatorColor: Colors.yellowAccent,
    colorScheme: const ColorScheme(
        primary: Colors.yellowAccent,
        primaryVariant: Colors.black,
        secondary: Colors.yellowAccent,
        secondaryVariant: Colors.yellowAccent,
        surface: Colors.yellowAccent,
        background: Colors.yellowAccent,
        error: Colors.yellowAccent,
        onPrimary: Colors.yellowAccent,
        onSecondary: Colors.yellowAccent,
        onSurface: Colors.yellowAccent,
        onBackground: Colors.yellowAccent,
        onError: Colors.yellowAccent,
        brightness: Brightness.light),
    textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.yellowAccent,
        selectionColor: Colors.yellowAccent,
        selectionHandleColor: Colors.yellowAccent),
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      titleTextStyle: TextStyle(color: Colors.yellowAccent),
    ),
    canvasColor: Colors.yellowAccent,
    backgroundColor: Colors.yellowAccent[100],
    scaffoldBackgroundColor: Colors.yellowAccent[100],
    cardColor: Colors.yellowAccent,
  );
}