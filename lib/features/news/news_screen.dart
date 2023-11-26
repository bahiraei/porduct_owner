import 'package:flutter/material.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _centerTitle = true;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.offset > 100) {
        // Adjust the threshold as needed
        if (_centerTitle) {
          setState(() {
            _centerTitle = false;
          });
        }
      } else {
        if (!_centerTitle) {
          setState(() {
            _centerTitle = true;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      //1
      body: CustomScrollView(
        slivers: <Widget>[
          //2
          SliverAppBar(
            backgroundColor: Colors.blue,
            expandedHeight: 300.0,
            elevation: 16,
            pinned: true,
            snap: false,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'افتتاح پروژه بزرگ انزلی',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              background: Image.asset(
                'assets/images/background.jpg',
                fit: BoxFit.cover,
              ),
              centerTitle: false,
              /*expandedTitleScale: 1.6,*/
              stretchModes: const [
                StretchMode.zoomBackground,
                StretchMode.fadeTitle,
              ],
              collapseMode: CollapseMode.pin,
              titlePadding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 16,
              ),
            ),
          ),

          //3
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Section 1',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text('Item 1'),
                  ),
                  ListTile(
                    title: Text('Item 2'),
                  ),
                  ListTile(
                    title: Text('Item 1'),
                  ),
                  ListTile(
                    title: Text('Item 2'),
                  ),
                  ListTile(
                    title: Text('Item 1'),
                  ),
                  ListTile(
                    title: Text('Item 2'),
                  ),
                  ListTile(
                    title: Text('Item 1'),
                  ),
                  ListTile(
                    title: Text('Item 2'),
                  ),
                  ListTile(
                    title: Text('Item 1'),
                  ),
                  ListTile(
                    title: Text('Item 2'),
                  ),
                  ListTile(
                    title: Text('Item 1'),
                  ),
                  ListTile(
                    title: Text('Item 2'),
                  ),

                  // Add more widgets as needed
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
