import 'package:flutter/material.dart';

class Demo1 extends StatefulWidget {
  @override
  _Demo1State createState() => _Demo1State();
}

class _Demo1State extends State<Demo1> {
  String selectedText = "";
  var selectedIndex = 0;
  var isPlaying = false;

  @override
  void initState() {
    super.initState();
    setSelectedIndex(0);
  }

  setSelectedIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              color: Colors.amber,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    selectedIndex.toString(),
                    style: TextStyle(fontSize: 50),
                  ),
                  isPlaying?
                  InkWell(
                    child: Icon(Icons.pause_rounded, 
                    size: 50,
                    ),
                    onTap: () {
                      setState(() {
                        isPlaying = !isPlaying;
                      });
                    },
                  )
                  : InkWell(
                    child: Icon(
                      Icons.play_arrow_rounded, 
                      size: 50
                    ),
                    onTap: () {
                      setState(() {
                        isPlaying = !isPlaying;
                      });
                    }
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                  child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, i) {
                        return Container(
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(i.toString()),
                              InkWell(
                                child: i != selectedIndex? 
                                Icon(Icons.play_arrow_rounded, size: 50, color: Colors.black.withOpacity(0.5))
                                : isPlaying ? 
                                Icon(Icons.pause_rounded, size: 50, color: Colors.black)
                                : Icon(Icons.play_arrow_rounded, size: 50, color: Colors.black),
                                onTap: () {
                                  if (i == selectedIndex) {
                                    //print(selectedIndex);
                                    setSelectedIndex(i);
                                    setState(() {
                                      isPlaying = !isPlaying;
                                    });
                                  } else {
                                    setSelectedIndex(i);
                                    setState(() {
                                      isPlaying = true;
                                    });
                                  }
                                },
                              ),
                            ],
                          ),
                        );
                      })),
            )
          ],
        ),
      ),
    );
  }
}
