import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monad/ui/common/app_constants.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../common/app_colors.dart';
import '../../widgets/Profile_widget.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/bottombar_widget.dart';

class TeamViewDesktop extends StatefulWidget {
  const TeamViewDesktop({super.key});

  @override
  State<TeamViewDesktop> createState() => _TeamViewDesktopState();
}

class _TeamViewDesktopState extends State<TeamViewDesktop> {
  final _routerService = locator<RouterService>();
  late ScrollController _controller;
  bool isSkeleteonWorking = true;
  /*  String _counter = "0";
  int _currentTime = 5; */

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    /* _startCountdown();
    fetchPhotosFromDiscordChannel(); */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MyAppBar(
        appBar: AppBar(),
        routerService: _routerService,
        pageNames: PageNames.team,
      ),
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          Image.asset("assets/images/gradient_back.png", fit: BoxFit.fill),
          ImprovedScrolling(
            scrollController: _controller,
            enableMMBScrolling: true,
            mmbScrollConfig: MMBScrollConfig(

                ),
            child: SingleChildScrollView(
              controller: _controller,
              child: SizedBox(
                height: 1777,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: 555,
                          width: MediaQuery.sizeOf(context).width,
                          child: ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: <Color>[
                                  Colors.black.withOpacity(
                                      0.6), // Orta kısım yarı şeffaf
                                  Colors
                                      .transparent, // Alt kısım tamamen şeffaf
                                ],
                                stops: const [
                                  0.5,
                                  0.95
                                ], // Renklerin geçiş noktaları
                              ).createShader(bounds);
                            },
                            blendMode:
                                BlendMode.dstIn, // Şeffaflık efektini uygula
                            child: Image.asset(
                              'assets/images/team_background.jpg', // Fotoğrafınızın yolu
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 400),
                          child: Center(
                            child: Column(
                              children: [
                                Text(
                                  "The Team",
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 44,
                                    color: monadWhiteRabbit,
                                  ),
                                )
                                    .animate()
                                    .fade(duration: Duration(milliseconds: 444))
                                    .moveY(begin: 50, end: 0),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 0),
                            child: SizedBox(
                              width: MediaQuery.sizeOf(context).width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: Wrap(
                                      alignment: WrapAlignment.center,
                                      direction: Axis.horizontal,
                                      children: [
                                        MouseRegion(
                                          onEnter: (event) {},
                                          onExit: (event) {},
                                          onHover: (event) {},
                                          child: UserWidget(
                                                  name: "Keone Hon",
                                                  descp: "CO-FOUNDER & CEO",
                                                  bio:
                                                      "Keone is a software developer and blockchain researcher. Prior to Monad, he spent eight years at Jump Trading, where he led an HFT team. In 2021, Keone joined Jump’s crypto division and led a team of engineers focused on blockchain research and dapp development.",
                                                  image:
                                                      "assets/images/team/keone.jpeg",
                                                  instaLink: "",
                                                  instaName: "",
                                                  location: "New York, USA",
                                                  twitterLink:
                                                      "https://twitter.com/keoneHD",
                                                  twitterUserName: "@keoneHD",
                                                  isBackroundActive: false)
                                              .animate()
                                              .fade(
                                                  delay: Duration(
                                                      milliseconds: 444),
                                                  duration: Duration(
                                                      milliseconds: 444))
                                              .moveY(begin: 50, end: 0),
                                        ),
                                        UserWidget(
                                                name: "James Hunsaker",
                                                descp: "CO-FOUNDER & CTO",
                                                bio:
                                                    "James is an expert at systems engineering and low-latency optimizations. Prior to Monad, he spent eight years at Jump Trading where he built an ultra-low-latency trading system responsible for tens of billions of notional daily volume in major futures markets.",
                                                image:
                                                    "assets/images/team/james.png",
                                                instaLink: "",
                                                instaName: "",
                                                location: "New York, USA",
                                                twitterLink:
                                                    "https://twitter.com/_jhunsaker",
                                                twitterUserName: "@_jhunsaker",
                                                isBackroundActive: false)
                                            .animate()
                                            .fade(
                                                delay:
                                                    Duration(milliseconds: 444),
                                                duration:
                                                    Duration(milliseconds: 444))
                                            .moveY(begin: 50, end: 0),
                                        UserWidget(
                                                name: "Eunice Giarta",
                                                descp: "CO-FOUNDER & COO",
                                                bio:
                                                    "Eunice is a product and tech leader, with a background in traditional finance and fintech. With a CS degree from MIT, she was previously in trading at BofA Merrill Lynch, and led product teams building enterprise trading systems at Broadway Technology and payments and licensing infra team at Shutterstock.",
                                                image:
                                                    "assets/images/team/eunice.jpg",
                                                instaLink: "",
                                                instaName: "",
                                                location: "New York, USA",
                                                twitterLink:
                                                    "https://twitter.com/0x_eunice",
                                                twitterUserName: "@0x_eunice",
                                                isBackroundActive: false)
                                            .animate()
                                            .fade(
                                                delay:
                                                    Duration(milliseconds: 444),
                                                duration:
                                                    Duration(milliseconds: 444))
                                            .moveY(begin: 50, end: 0),
                                        /*   UserWidget(
                                        name: "Ariq Chowdhury",
                                        descp: "Founding Engineer",
                                        image: "assets/images/team/Ariq.png",
                                        instaLink: "",
                                        instaName: "",
                                        location: "Burnaby, British Columbia",
                                        twitterLink: "",
                                        twitterUserName: "",
                                        isBackroundActive: true,)  .animate()
                                        .fade(delay: Duration(milliseconds: 444),duration: Duration(milliseconds: 444))
                                        .moveY(begin: 50, end: 0),
                                        
                                    UserWidget(
                                        name: "Harry",
                                        descp: "",
                                        image: "",
                                        instaLink: "",
                                        instaName: "",
                                        location: "",
                                        twitterLink: "",
                                        twitterUserName: ""),
                                    UserWidget(
                                        name: "Lily",
                                        descp: "",
                                        image: "",
                                        instaLink: "",
                                        instaName: "",
                                        location: "",
                                        twitterLink: "",
                                        twitterUserName: ""),
                                    UserWidget(
                                        name: "Avery",
                                        descp: "",
                                        image: "",
                                        instaLink: "",
                                        instaName: "",
                                        location: "",
                                        twitterLink: "",
                                        twitterUserName: ""),
                                    UserWidget(
                                        name: "Ivy",
                                        descp: "",
                                        image: "",
                                        instaLink: "",
                                        instaName: "",
                                        location: "",
                                        twitterLink: "",
                                        twitterUserName: ""),  */
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [BottomBar()],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
