import 'package:flutter/material.dart';
import 'assets.dart';

import 'scaffold_pattern.dart';
import 'top_container_stars.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ScaffoldPattern(
      bodyPage: SizedBox(
        width: size.width,
        height: size.height,
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: <Widget>[
            const SliverAppBar(
              backgroundColor: Colors.black,
              expandedHeight: 250.0,
              flexibleSpace: FlexibleSpaceBar(
                // title: Text('Goa', textScaleFactor: 1),
                background: TopContainerPatternStar(
                    star: 2, title: 'asdasd', profile: barberPhoto),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, int index) {
                  return const SizedBox(
                    
                    // decoration: BoxDecoration(
                    //     image: DecorationImage(image: AssetImage(fundoGeral))),
                    // color: Colors.red,
                    height: 900,
                    width: 50,
                  );
                },
                childCount: 1,
              ),
            ),
          ],
        ),
      ),
      // bodyPage: TopContainerPattern(
      //     name: 'The Gentleman', profile: barberPhoto, title: 'the Gentleman'),
    );
  }
}