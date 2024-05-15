import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.all(25.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff462276),
              Color(0xff7A558C),
            ],
          ),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Gap(30),

            //icons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.grid_view,
                    size: 30,
                    color: Colors.white,
                  ),
                ),

                IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.supervised_user_circle_outlined,
                    size: 30,
                    color: Colors.white,
                  ),
                ),

              ],
            ),

            Gap(40),

            //texts
            Text(
              'Welcome',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),

            Gap(5),

            Text(
              'Enjoy Your Favorite Music',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),

            Gap(30),

            //search bar
            SearchBar(
              leading: Icon(
                Icons.search,
                color: Colors.grey,
              ),
              hintText: 'Search',
              hintStyle: MaterialStatePropertyAll(
                TextStyle(color: Colors.grey),
              ),
              padding: MaterialStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 20),
              ),
              shadowColor: MaterialStatePropertyAll(Colors.transparent),

            ),

            Gap(30),

            //trending music section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text(
                  'Trending Music',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),

                Text(
                  'View More',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                )

              ],
            )

            //cover flow horizontal

            //playlist section

            //playlist listView expanded
          ],
        ),
      )
    );
  }
}
