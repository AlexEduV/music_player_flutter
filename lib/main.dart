import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:music_player_flutter/widgets/play_button.dart';
import 'package:music_player_flutter/widgets/section_row.dart';

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
        padding: const EdgeInsets.only(top: 25),
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
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
            ),

            const Gap(40),

            //texts
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                'Welcome',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),

            const Gap(5),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                'Enjoy Your Favorite Music',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),

            const Gap(30),

            //search bar
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: SearchBar(
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
            ),

            const Gap(30),

            //trending music section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: SectionRow(
                sectionTitle: 'Trending Music',
              ),
            ),

            const Gap(20),

            //cover flow horizontal
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: SizedBox(
                height: 240,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemBuilder: (context, index) {

                    return Stack(
                      children: [

                        Container(
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: Colors.grey[800],
                          ),
                        ),

                        Positioned(
                          left: 16,
                          right: 16,
                          bottom: 10,
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18.0),
                              color: Colors.white70,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                //song details
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Runaway',
                                      style: TextStyle(
                                        color: Color(0xff462276),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),

                                    Text(
                                      'Aurora',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),

                                //play/pause button
                                PlayButton(
                                  tintColor: Colors.grey[200]!,
                                  backgroundColor: const Color(0xff462276),
                                  size: 20,
                                ),


                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Gap(25);
                  },
                ),
              ),
            ),

            const Gap(20),

            //playlist section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: SectionRow(
                sectionTitle: 'Playlists',
              ),
            ),

           const Gap(20),

            //playlist listView expanded
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff462276).withOpacity(0.5),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      child: Row(
                        children: [

                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              color: Colors.grey,
                            ),
                          ),

                          const Gap(16.0),

                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text(
                                  'Hip-Hop R&B Mix',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),

                                Text(
                                  '30 Songs',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),

                              ],
                            ),
                          ),

                          const Gap(16.0),

                          //play/pause button
                          PlayButton(
                            tintColor: const Color(0xff462276),
                            backgroundColor: Colors.grey[200]!,
                            size: 22,
                          ),

                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Gap(20);
                  },
                  itemCount: 4,
                ),
              ),
            )

          ],
        ),
      )
    );
  }
}
