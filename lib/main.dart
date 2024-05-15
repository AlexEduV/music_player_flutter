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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Gap(30),

            //icons
            const Row(
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

            const Gap(40),

            //texts
            const Text(
              'Welcome',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),

            const Gap(5),

            const Text(
              'Enjoy Your Favorite Music',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),

            const Gap(30),

            //search bar
            const SearchBar(
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

            const Gap(30),

            //trending music section
            const Row(
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

                TextButton(
                  onPressed: null,
                  child: Text(
                    'View More',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                    ),
                  ),
                ),

              ],
            ),

            const Gap(30),

            //cover flow horizontal
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (context, index) {

                  return Container(
                    width: 200,
                    margin: const EdgeInsets.only(right: 16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),

            //playlist section

            //playlist listView expanded

            const Spacer(),
          ],
        ),
      )
    );
  }
}
