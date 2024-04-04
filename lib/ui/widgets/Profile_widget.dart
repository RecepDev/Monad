// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class UserWidget extends StatelessWidget {
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
  }) : super(key: key);

  final String name;
  final String descp;
  final String location;
  final String twitterUserName;
  final String twitterLink;
  final String instaName;
  final String instaLink;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 530,
      height: 270,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(33),
          ),
          color: Colors.transparent,
          shape: BoxShape.rectangle),
      child: Row(
        children: [
          CircleAvatar(
            radius: 70,
            backgroundImage: AssetImage(image),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 75, left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 28,
                      fontWeight: FontWeight.w800),
                ),
                Text(
                  " $descp",
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
                      location,
                      style: const TextStyle(color: Colors.white, fontSize: 13),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    if (twitterUserName != "")
                      const Icon(
                        FontAwesomeIcons.xTwitter,
                        color: Colors.white,
                      ),
                    SizedBox(
                      width: 2,
                    ),
                    InkWell(
                      onTap: () => launchUrl(Uri.parse(twitterLink)),
                      child: Text(
                        twitterUserName,
                        style:
                            const TextStyle(color: Colors.blue, fontSize: 13),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    if (instaName != "")
                      const Icon(
                        FontAwesomeIcons.instagram,
                        color: Colors.white,
                      ),
                    SizedBox(
                      width: 2,
                    ),
                    InkWell(
                      onTap: () => launchUrl(Uri.parse(instaLink)),
                      child: Text(
                        instaName,
                        style:
                            const TextStyle(color: Colors.blue, fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
