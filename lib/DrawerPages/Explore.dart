import 'package:flutter/material.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 42, right: 30, left: 30),
            child: Row(
              children: [
                Container(
                  height: 349,
                  width: 317,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('lib/assets/explore1.png'),
                        fit: BoxFit.fill),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                          child: Container(
                            height: 56,
                            width: 47,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('lib/assets/logo1.png'),
                                    fit: BoxFit.cover)),
                          )),
                      const SizedBox(
                        height: 30,
                      ),
                      const Center(
                        child: Text(
                          '''50% Off
                        Everything''',
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          style: TextStyle(
                              fontSize: 36,
                              height: 0,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Center(
                        child: Text('with code: sativa 123'),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Container(
                    height: 349,
                    width: 317,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('lib/assets/explore1.png'),
                          fit: BoxFit.fill),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                            child: Container(
                              height: 56,
                              width: 47,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('lib/assets/logo1.png'),
                                      fit: BoxFit.cover)),
                            )),
                        const SizedBox(
                          height: 30,
                        ),
                        const Center(
                          child: Text(
                            '''50% Off
                          Everything''',
                            textAlign: TextAlign.center,
                            maxLines: 3,
                            style: TextStyle(
                                fontSize: 36,
                                height: 0,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Center(
                          child: Text('with code: sativa 123'),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
