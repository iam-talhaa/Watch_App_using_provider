import 'package:favourite_app_using_provider/provider/fav_provider.dart';
import 'package:favourite_app_using_provider/screen/favourite_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class homepage extends StatefulWidget {
  homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<fav_provider>(context, listen: true);
    print('BUILD');
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          backgroundColor: Color.fromRGBO(244, 243, 243, 0.699),
          icon: Icon(Icons.home, color: Colors.cyan[300]),
          label: '',
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.cyan[300],
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(Icons.add, color: Colors.cyan[300]), label: ''),
        BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.cyan[300]), label: ''),
      ]),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(244, 243, 243, 1),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => page_2()));
              },
              icon: Icon(Icons.favorite)),
          SizedBox(
            width: 22,
          )
        ],
        title: Text(
          'Watch App',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 12,
                itemBuilder: (context, index) {
                  return Consumer<fav_provider>(
                      builder: (context, value, child) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 15),
                      child: Card(
                        child: Column(
                          children: [
                            image_list[index].image,
                            ListTile(
                              onTap: () {
                                if (value.fav_items.contains(index)) {
                                  value.remove_fav(index);
                                } else {
                                  value.set_fav(index);
                                }
                              },
                              title: Text(
                                'Watch',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text('300 \$ '),
                              trailing: IconButton(
                                  onPressed: () {},
                                  icon: Icon(value.fav_items.contains(index)
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined)),
                              leading: Icon(Icons.timer_sharp),
                            )
                          ],
                        ),
                      ),
                    );
                  });
                }),
          )
        ],
      ),
    );
  }
}

class Myimage {
  final Image image;

  Myimage({required this.image});
}

final List<Myimage> image_list = [
  Myimage(image: Image.asset('images/11.jpg')),
  Myimage(image: Image.asset('images/12.jpg')),
  Myimage(image: Image.asset('images/three.jpg')),
  Myimage(image: Image.asset('images/four.jpg')),
  Myimage(image: Image.asset('images/five.jpg')),
  Myimage(image: Image.asset('images/six.jpg')),
  Myimage(image: Image.asset('images/seven.jpg')),
  Myimage(image: Image.asset('images/eight.jpg')),
  Myimage(image: Image.asset('images/one.jpg')),
  Myimage(image: Image.asset('images/ten.jpg')),
  Myimage(image: Image.asset('images/11.jpg')),
  Myimage(image: Image.asset('images/two.jpg')),
];
