import 'package:flutter/material.dart';
import 'package:simple_travel/FadeAnimation.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Nunito'),
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  PageController _pageController;
  int totalPage = 3;

  void _onScroll() {}

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    )..addListener(_onScroll);

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          makePage(
              page: 1,
              image: 'assets/images/one.jpeg',
              title: 'Borobudur Tample',
              description:
                  "This famous Buddhist temple, dating from the 8th and 9th centuries, is located in central Java. It was built in three tiers: a pyramidal base with five concentric square terraces, the trunk of a cone with three circular platforms and, at the top, a monumental stupa. The walls and balustrades are decorated with fine low reliefs, covering a total surface area of 2,500 m2. Around the circular platforms are 72 openwork stupas, each containing a statue of the Buddha. The monument was restored with UNESCO's help in the 1970s."),
          makePage(
              page: 2,
              image: 'assets/images/two.jpeg',
              title: 'Mount Bromo',
              description:
                  'Mount Bromo is an active volcano crater located in East Java, Indonesia. It’s located between the cities of Malang, Surabaya, and Probolinggo, and you can visit it from any of those places. The Bromo mountain is part of the Bromo Tengger Semeru National Park, where you can see a famous cluster of 5 volcanoes (including Bromo), and Java’s highest mountain Semeru puffing out smoke in the background.'),
          makePage(
              page: 3,
              image: 'assets/images/three.jpeg',
              title: 'Raja Ampat',
              description:
                  'Raja Ampat, or the Four Kings, is an archipelago located off the northwest tip of Bird\'s Head Peninsula on the island of New Guinea, in Indonesia\'s West Papua province. It comprises over 1,500 small islands, cays, and shoals surrounding the four main islands of Misool, Salawati, Batanta, and Waigeo, and the smaller island of Kofiau. The Raja Ampat archipelago straddles the Equator and forms part of Coral Triangle which contains the richest marine biodiversity on earth.')
        ],
      ),
    );
  }
}

Widget makePage({image, title, description, page, totalPage}) {
  return Container(
    decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
    child: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.bottomRight, stops: const [
        0.3,
        0.9
      ], colors: [
        Colors.black.withOpacity(.9),
        Colors.black.withOpacity(.2),
      ])),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                FadeAnimation(
                  2,
                  Text(
                    page.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Text(
                  '/3',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                )
              ],
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeAnimation(
                    1,
                    Text(
                      title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          height: 1.2,
                          fontWeight: FontWeight.bold),
                    )),
                const SizedBox(
                  height: 20,
                ),
                FadeAnimation(
                    1.5,
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 3),
                          child: const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 15,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 3),
                          child: const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 15,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 3),
                          child: const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 15,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 3),
                          child: const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 15,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 5),
                          child: const Icon(
                            Icons.star,
                            color: Colors.grey,
                            size: 15,
                          ),
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 20,
                ),
                FadeAnimation(
                    2,
                    Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: Text(
                        description,
                        style: TextStyle(
                            color: Colors.white.withOpacity(.7),
                            height: 1.9,
                            fontSize: 15),
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                FadeAnimation(
                    2.5,
                    const Text(
                      'READ MORE',
                      style: TextStyle(color: Colors.white),
                    )),
                const SizedBox(
                  height: 30,
                )
              ],
            ))
          ],
        ),
      ),
    ),
  );
}
