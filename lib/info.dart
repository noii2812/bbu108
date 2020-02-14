import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sampleproject/movies.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    final List<String> movies = [
      'assets/images/joker.jpg',
      'assets/images/friendZone.jpg',
      'assets/images/morethanblue.jpg',
      'assets/images/london.jpg'
    ];
    final List<String> lmovies = [
      'assets/images/bbforlife.jpg',
      'assets/images/friendZone.jpg',
      'assets/images/morethanblue.jpg',
      'assets/images/london.jpg'
    ];
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Container(
          width: size.width,
          // height: 20000,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 10, 10, 0),
                child: Container(
                  height: 40,
                  width: size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text(
                          'Popular',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              decoration: TextDecoration.none,
                              fontFamily: 'Open Sans'),
                        ),
                      ),
                      Container(
                          //color: Colors.blue,
                          child: Text(
                        'See More ->',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            decoration: TextDecoration.none,
                            fontFamily: 'Open Sans'),
                      )),
                    ],
                  ),
                ),
              ),
              Container(
                  //color: Colors.red,
                  width: size.width,
                  height: 200,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.fromLTRB(5, 0, 8, 8),
                      itemCount: movies.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 6, 0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          MoviesPage()));
                            },
                            child: Hero(
                              tag: Info(),
                              child: Container(
                                width: size.width * 0.35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(movies[index]))),
                              ),
                            ),
                          ),
                        );
                      })),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 10, 10, 0),
                child: Container(
                  height: 40,
                  width: size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                          width: size.width / 2,
                          //color: Colors.blue,
                          child: Text(
                            'Latest Movies',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                decoration: TextDecoration.none,
                                fontFamily: 'Open Sans'),
                          )),
                      Container(

                          //color: Colors.blue,
                          child: Text(
                        'See More ->',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            decoration: TextDecoration.none,
                            fontFamily: 'Open Sans'),
                      )),
                    ],
                  ),
                ),
              ),
              Container(
                  //color: Colors.red,
                  width: size.width,
                  height: 200,
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      controller: ScrollController(keepScrollOffset: false),
                      padding: const EdgeInsets.fromLTRB(5, 0, 8, 8),
                      itemCount: movies.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(6),
                          child: Container(
                            width: size.width,
                            height: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(lmovies[index]))),
                          ),
                        );
                      })),
            ],
          )),
    );
  }
}
