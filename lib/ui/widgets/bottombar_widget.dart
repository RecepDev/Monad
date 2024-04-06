import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 200,
      child: Column(
        children: [
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          SizedBox(
            height: 190,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 65,
                  child: Container(
                    width: 200,
                    child: Text("data"),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: VerticalDivider(
                    color: Colors.grey,
                    thickness: 1,
                    indent: 15,
                    endIndent: 15,
                  ),
                ),
                Expanded(
                  flex: 25,
                  child: Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Memes",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "News",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Social",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Team",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "About",
                          style: TextStyle(color: Colors.white),
                        ),
                        
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
