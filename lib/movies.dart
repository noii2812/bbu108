import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sampleproject/info.dart';

class MoviesPage extends StatefulWidget {
  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  final List<String> movies = [
    'assets/images/joker.jpg',
    'assets/images/friendZone.jpg',
    'assets/images/morethanblue.jpg',
    'assets/images/london.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Hero(
        tag: Info(),
        child: Container(
          width: size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: ExactAssetImage(movies[0]), fit: BoxFit.cover),
          ),
          child: Stack(
            children: [
              ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.black.withOpacity(0.1),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: Container(
                          width: size.width * 0.8,
                          height: size.height * 0.7,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white.withOpacity(0.7)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                  left: size.width * 0.23,
                  top: size.height * 0.08,
                  child: Text('JOKER',
                      style: TextStyle(
                        fontSize: 60,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ))),
              Positioned(
                  top: size.height * 0.2,
                  right: size.width * 0.28,
                  left: size.width * 0.28,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white.withOpacity(0.6)),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.red,
                      image: DecorationImage(
                          image: ExactAssetImage('assets/images/joker.jpg'),
                          fit: BoxFit.cover),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
