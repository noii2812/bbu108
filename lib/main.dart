import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:sampleproject/location.dart';
import 'info.dart';

final List<String> movies = [
  'assets/images/joker.jpg',
  'assets/images/friendZone.jpg',
  'assets/images/morethanblue.jpg',
  'assets/images/london.jpg'
];
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Widget> containers = [
    Container(
      child: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          controller: ScrollController(keepScrollOffset: false),
          padding: const EdgeInsets.fromLTRB(5, 0, 8, 8),
          itemCount: movies.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(6),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    image: DecorationImage(
                        fit: BoxFit.fill, image: AssetImage(movies[index]))),
              ),
            );
          }),
    ),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.yellow,
    ),
    Container(
      color: Colors.blue,
    ),
  ];
  final List<String> entries = ['A', 'B', 'C'];
  final List<int> colorCodes = [600, 500, 100];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black38,
      body: DefaultTabController(
        length: 4,
        initialIndex: 0,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              primary: true,
              snap: true,
              backgroundColor: Colors.black,
              title: Text(
                'Movies',
                style: TextStyle(color: Colors.red, fontSize: 18),
              ),
              actions: <Widget>[
                IconButton(icon: Icon(Icons.search), onPressed: () {})
              ],
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: CustomerHeaderDelegate(
                  child: Container(
                    color: Colors.black,
                    height: 70,
                    child: TabBar(
                      tabs: [
                        Text('Movies'),
                        Text('Location'),
                        Text('Coming Soon'),
                        Text('Tickets')
                      ],
                      indicatorPadding: const EdgeInsets.only(top: 0),
                      // controller: _tabController,
                      indicatorColor: Colors.red,
                      labelPadding: const EdgeInsets.fromLTRB(2, 8, 2, 8),
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  min: 70.0,
                  max: 70.0),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 20,
                child: Row(
                  children: <Widget>[
                    Text(
                      "Latest Movie",
                      style: TextStyle(color: Colors.white),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Text("See More >>>")
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: TabBarView(children: containers)),
            )
          ],
        ),
      ),
    );
  }
}

class CustomerHeaderDelegate extends SliverPersistentHeaderDelegate {
  final num min;
  final num max;
  final Color color;
  final Widget child;
  CustomerHeaderDelegate({this.child, this.min, this.max, this.color});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => max;

  @override
  double get minExtent => min;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
