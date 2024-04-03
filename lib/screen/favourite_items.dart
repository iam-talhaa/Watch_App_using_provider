import 'package:favourite_app_using_provider/provider/fav_provider.dart';
import 'package:favourite_app_using_provider/screen/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class page_2 extends StatefulWidget {
  const page_2({super.key});

  @override
  State<page_2> createState() => _page_2State();
}

class _page_2State extends State<page_2> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<fav_provider>(context);
    print('BUILD');
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          backgroundColor: Color(0xff616e7e),
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
          'Favourite Watchs List',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: provider.fav_items.length,
                itemBuilder: (context, index) {
                  return Consumer<fav_provider>(
                      builder: (context, value, child) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
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
                              title: Text('Watch'),
                              subtitle: Text('300\$'),
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
