import 'package:calorie/screens/first_screen.dart';
import 'package:calorie/screens/four_screen.dart';
import 'package:calorie/screens/second_screen.dart';
import 'package:calorie/screens/third_screen.dart';
import 'package:flutter/material.dart';

class KullaniciSayfasi extends StatefulWidget {
  @override
  State<KullaniciSayfasi> createState() => _KullaniciSayfasiState();
}

class _KullaniciSayfasiState extends State<KullaniciSayfasi> {
  List screens = [
    const FirstScreen(),
    const SecondScreen(),
    const ThirdScreen(),
    const FourScreen()
  ];
  int selectedCardIndex = -1;
  List<int> selectedCards = [];
  List<bool> selected = [false, false, false, false, false, false];

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              color: Colors.white,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                padding: EdgeInsets.all(45),
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        // Kart seçildiğinde ilgili liste güncellenir
                        if (selectedCards.contains(index)) {
                          selectedCards.remove(index);
                          selected[index] = false;
                        } else {
                          selectedCards.add(index);
                          selected[index] = true;
                        }
                      });
                    },
                    child: Card(
                      color: selected[index]
                          ? const Color.fromARGB(255, 0, 140, 255)
                          : const Color.fromARGB(255, 255, 255, 255),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/photo_$index.jpg'),
                        ),
                        title: Text('Kart $index'),
                        subtitle:
                            Text(selected[index] ? 'Seçildi' : 'Seçilmedi'),
                      ),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                  );
                },
              ),
            );
          },
        );
      },
    ).then((value) {
      setState(() {
        selectedCards.clear();
        selected = List.generate(6, (index) => false);
      });
    });
  }

  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentTab],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showBottomSheet();
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Material(
                child: Center(
                  child: InkWell(
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.home),
                        //const Padding(padding: EdgeInsets.all(10))
                      ],
                    ),
                  ),
                ),
              ),
              Material(
                child: Center(
                  child: InkWell(
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.gps_fixed),
                        //const Padding(padding: EdgeInsets.only(left: 10))
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(), //to make space for the floating button
              Material(
                child: Center(
                  child: InkWell(
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          currentTab = 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.fact_check),
                          //const Padding(padding: EdgeInsets.only(right: 10))
                        ],
                      )),
                ),
              ),
              Material(
                child: Center(
                  child: InkWell(
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person),
                        //const Padding(padding: EdgeInsets.only(left: 10))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
