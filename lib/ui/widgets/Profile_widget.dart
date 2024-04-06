// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monad/ui/common/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class UserWidget extends StatefulWidget {
  const UserWidget({
    Key? key,
    required this.name,
    required this.descp,
    required this.location,
    required this.twitterUserName,
    required this.twitterLink,
    required this.instaName,
    required this.instaLink,
    required this.image,
    required this.bio,
    required this.isBackroundActive,
  }) : super(key: key);

  final String name;
  final String descp;
  final String location;
  final String twitterUserName;
  final String twitterLink;
  final String instaName;
  final String instaLink;
  final String image;
  final String bio;
  final bool isBackroundActive;

  @override
  State<UserWidget> createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {
  bool isInfoButtonVisible = false;
  bool isProfileVisible = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isInfoButtonVisible = true;
        });
      },
      onExit: (event) {
        setState(() {
          isInfoButtonVisible = false;
        });
      },
      onHover: (event) {},
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            width: 444,
            height: 200,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(33),
                ),
                color: Colors.transparent,
                shape: BoxShape.rectangle),
            child: Row(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundColor:
                          widget.isBackroundActive ? monadWine : null,
                      backgroundImage: AssetImage(widget.image),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Visibility(
                        visible: isInfoButtonVisible,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              isProfileVisible = true;
                            });
                          },
                          icon: Icon(
                            Icons.info,
                            color: monadWhiteRabbit,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 41, left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: const TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 28,
                            fontWeight: FontWeight.w800),
                      ),
                      Text(
                        " ${widget.descp}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            widget.location,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 13),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          if (widget.twitterUserName != "")
                            const Icon(
                              FontAwesomeIcons.xTwitter,
                              color: Colors.white,
                            ),
                          SizedBox(
                            width: 2,
                          ),
                          InkWell(
                            onTap: () =>
                                launchUrl(Uri.parse(widget.twitterLink)),
                            child: Text(
                              widget.twitterUserName,
                              style: const TextStyle(
                                  color: Colors.blue, fontSize: 13),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          if (widget.instaName != "")
                            const Icon(
                              FontAwesomeIcons.instagram,
                              color: Colors.white,
                            ),
                          SizedBox(
                            width: 2,
                          ),
                          InkWell(
                            onTap: () => launchUrl(Uri.parse(widget.instaLink)),
                            child: Text(
                              widget.instaName,
                              style: const TextStyle(
                                  color: Colors.blue, fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: isProfileVisible,
            child: Container(
              width: 400,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: monadWine),
                boxShadow: [
                  BoxShadow(offset: Offset(10, 10), color: Colors.black12)
                ],
                color: monadBlue,
                borderRadius: BorderRadius.circular(22),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 2, right: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            hoverColor: monadWine,
                            splashColor: monadElectricIce,
                            focusColor: monadElectricIce,
                            onPressed: () {
                              setState(() {
                                isProfileVisible = !isProfileVisible;
                              });
                            },
                            icon: Icon(
                              Icons.clear,
                              color: monadElectricIce,
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 41,right: 8,left: 8,bottom: 5),
                    child: Container(
                      child: Text(
                        widget.bio,
                        style: GoogleFonts.montserrat(color: monadWhiteRabbit),
                      ),
                    ),
                  ),
                ],
              ),
            ).animate().fade(),
          ),
        ],
      ),
    );
  }
}
