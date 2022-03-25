import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:messnger/json/data.dart';
import 'package:messnger/theme/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

//bool clr = false;
int pageIndex = 0;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          appBar(),
          Expanded(
              flex: 8,
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                         Container(
                          width: double.infinity,
                          height: 40,
                          decoration: BoxDecoration(
                              color: grey,
                              borderRadius: BorderRadius.circular(15)),
                          child: TextField(
                            cursorColor: black,
                            //  controller: _searchController,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  LineIcons.search,
                                  color: black.withOpacity(0.5),
                                ),
                                hintText: "Search",
                                border: InputBorder.none),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              
                              Container(
                                width: 55,
                                height: 55,
                                child: LineIcon(Icons.video_call),
                                decoration: BoxDecoration(
                                    color: grey,
                                    borderRadius: BorderRadius.circular(26)),
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              story(),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: List.generate(userStories.length, (index) {
                            return InkWell(
                                child: Padding(
                              padding: EdgeInsets.only(bottom: 20),
                              child: Row(
                                children: [
                                  Container(
                                    width: 65,
                                    height: 65,
                                    child: Stack(
                                      children: [
                                        //boolean var
                                        userStories[index]['story']
                                            ? Container(
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        color: blue_story,
                                                        width: 3)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(3.0),
                                                  child: Container(
                                                    width: 65,
                                                    height: 65,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                                userStories[
                                                                        index]
                                                                    ['img']),
                                                            fit: BoxFit.cover),
                                                        color: grey,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(26)),
                                                  ),
                                                ),
                                              )
                                            : Container(
                                                width: 60,
                                                height: 60,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            userStories[index]
                                                                ['img']),
                                                        fit: BoxFit.cover),
                                                    color: grey,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            26)),
                                              ),
                                        userStories[index]['online']
                                            ? Positioned(
                                                top: 38,
                                                left: 45,
                                                child: Container(
                                                  width: 20,
                                                  height: 20,
                                                  decoration: BoxDecoration(
                                                      color: online,
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          color: white,
                                                          width: 3)),
                                                ))
                                            : Container()
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(userStories[index]['name'],
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      SizedBox(
                                          width:
                                            MediaQuery.of(context).size.width -
                                                135,
                                        child: Text(userStories[index]['message']+""+userStories[index]['created_at'],
                                        style: TextStyle(
                                              fontSize: 15,
                                              color: black.withOpacity(0.8)),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )
                                      
                                    ],
                                  )
                                ],
                              ),
                            ));
                          }),
                        )
                      ],
                    ),
                  ),
                ),
              )),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              child: navbar(),
            ),
          ),
        ],
      ),
    ));
  }

  Row story() {
    return Row(
      children: List.generate(userStories.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Column(
            children: [
              Container(
                width: 65,
                height: 65,
                child: Stack(
                  children: [
                    //boolean var
                    userStories[index]['story']
                        ? Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: blue_story, width: 3)),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Container(
                                width: 65,
                                height: 65,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            userStories[index]['img']),
                                        fit: BoxFit.cover),
                                    color: grey,
                                    borderRadius: BorderRadius.circular(26)),
                              ),
                            ),
                          )
                        : Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        NetworkImage(userStories[index]['img']),
                                    fit: BoxFit.cover),
                                color: grey,
                                borderRadius: BorderRadius.circular(26)),
                          ),
                    userStories[index]['online']
                        ? Positioned(
                            top: 38,
                            left: 45,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  color: online,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: white, width: 3)),
                            ))
                        : Container()
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Padding navbar() {
    List buttonSheet = [
      pageIndex == 0 ? "assets/svg/chats.svg" : "assets/svg/chats.svg",
      pageIndex == 1
          ? "assets/svg/account_active_icon.svg"
          : "assets/svg/account_active_icon.svg",
      pageIndex == 2 ? "assets/svg/story.svg" : "assets/svg/story.svg",
    ];
    List clr = [
      pageIndex == 0 ? Colors.blue : Colors.grey,
      pageIndex == 1 ? Colors.blue : Colors.grey,
      pageIndex == 2 ? Colors.blue : Colors.grey,
    ];
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(buttonSheet.length, (index) {
          return InkWell(
            onTap: () {
              selectedTap(index);
            },
            child: SvgPicture.asset(
              buttonSheet[index],
              width: 40,
              color: clr[index],
            ),
          );
        }),
      ),
    );
  }

  selectedTap(index) {
    setState(() {
      pageIndex = index;
    });
  }
}

class appBar extends StatelessWidget {
  const appBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/7.jpg"),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      "Chats",
                      style:
                          TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          color: grey, borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Image(
                          image: AssetImage('assets/svg/pen.png'),
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          color: grey, borderRadius: BorderRadius.circular(25)),
                      child: Center(
                        child: Image(
                          image: AssetImage('assets/svg/Camera.png'),
                          width: 20,
                          height: 20,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
