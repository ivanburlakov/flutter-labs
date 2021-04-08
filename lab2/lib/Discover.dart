import 'package:flutter/material.dart';

class Discover extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
        padding: const EdgeInsets.only(
          top: 20.0,
        ),
        child: Image.asset(
          'assets/images/googlelogo.png',
          height: 44,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(
          top: 18.0,
          left: 18.0,
          right: 18.0,
        ),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(25)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                child: Icon(
                  Icons.search,
                  size: 28,
                  color: Colors.grey.shade600,
                ),
              ),
              Expanded(
                  child: Text(
                'Search...',
                style: TextStyle(fontSize: 16, color: Colors.grey.shade400),
              )),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                child: Image.asset(
                  'assets/images/googlemic.png',
                  height: 22,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Image.asset(
                  'assets/images/googlelens.png',
                  height: 26,
                ),
              )
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(
          top: 18.0,
          left: 18.0,
          right: 18.0,
        ),
        child: Container(
          height: 74,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 18.0,
                  right: 18.0,
                ),
                child: Image.asset(
                  'assets/images/mostlycloudy.png',
                  height: 40,
                ),
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kyiv: 7°C',
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                  Text(
                    'Cloudy',
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade400),
                  ),
                ],
              )),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '8°/-1°',
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    Transform.translate(
                      offset: Offset(-3, 0),
                      child: Container(
                        child: Row(children: [
                          Icon(
                            Icons.umbrella,
                            size: 14,
                            color: Colors.grey.shade500,
                          ),
                          Text(
                            '10 % today',
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey.shade400),
                          ),
                        ]),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        for (var article in news)
          Padding(
            padding: const EdgeInsets.only(
              top: 18.0,
              left: 18.0,
              right: 18.0,
            ),
            child: Container(
              height: 350,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0)),
                    child: FittedBox(
                      child: Image.asset(
                        article['image'],
                        height: 40,
                      ),
                      fit: BoxFit.cover,
                    ),
                  )),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 16.0,
                              left: 16.0,
                              right: 16.0,
                            ),
                            child: Text(
                              article['title'],
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 16.0,
                                  right: 16.0,
                                ),
                                child: Text(
                                  article['text'],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 16.0,
                                right: 16.0,
                                bottom: 16.0,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Icon(Icons.web),
                                      ),
                                      Text(
                                        article['resource'],
                                        style: TextStyle(
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                      Text(
                                        ' • ',
                                        style: TextStyle(
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                      Text(
                                        article['ago'] + ' ago',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                    ],
                                  )),
                                  Icon(
                                    Icons.favorite_border,
                                    color: Colors.grey.shade600,
                                    size: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 26.0),
                                    child: Icon(
                                      Icons.share_outlined,
                                      color: Colors.grey.shade600,
                                      size: 20,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 26.0),
                                    child: Icon(
                                      Icons.more_vert,
                                      color: Colors.grey.shade600,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
                ],
              ),
            ),
          ),
      ]),
      SizedBox(
        height: 40.0,
      )
    ]);
  }
}

var news = [
  {
    'image': 'assets/images/classico.jpg',
    'title':
        "Real Madrid vs Barcelona: All eyes on the biggest Clasico in years with La Liga title race on knife-edge",
    'text':
        "Spanish football expert Alvaro Montero discusses the key talking points ahead of this weekend's Clasico; Follow Real Madrid vs Barcelona with our dedicated live blog across Sky Sports' digital platforms on Saturday from 6.30pm; Kick-off 8pm.",
    'resource': 'sky sports',
    'ago': '1 hour'
  },
  {
    'image': 'assets/images/xiaomi.jpg',
    'title':
        "The Xiaomi Mi 11 Ultra’s brand new 50MP camera can produce DSLR-like bokeh",
    'text':
        "Last year’s Xiaomi Mi 10 Ultra was my favorite slab phone of 2020, but many consumers in the west were left out because it was a China-only release. That makes this year’s Mi 11 Ultra that much more exciting — it’s going on sale throughout Europe and Asia and packs some new never-before-seen camera tech.",
    'resource': 'xda',
    'ago': '5 hours'
  },
  {
    'image': 'assets/images/amp.jpg',
    'title':
        "Harley Benton launches the Airborne Go, a \$140, feature-packed desktop amp with built-in guitar wireless system",
    'text':
        "New practice amp includes a wireless transmitter, and sports \"HD\" modeling, Bluetooth, 13 digital effects and an app for advanced tone shaping.",
    'resource': 'Guitar World',
    'ago': '21 hours'
  },
];
