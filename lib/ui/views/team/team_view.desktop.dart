import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monad/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../common/app_colors.dart';
import '../../widgets/Profile_widget.dart';
import 'team_viewmodel.dart';

class TeamViewDesktop extends ViewModelWidget<TeamViewModel> {
  const TeamViewDesktop({super.key});

  @override
  Widget build(BuildContext context, TeamViewModel viewModel) {
    final _routerService = locator<RouterService>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                monadBlue, // Orta kısım yarı şeffaf
                Colors.transparent, // Alt kısım tamamen şeffaf
              ],
              stops: const [0.05, 1], // Renklerin geçiş noktaları
            ),
          ),
          child: Center(),
        ),
        scrolledUnderElevation: 00,
        foregroundColor: Colors.transparent,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leadingWidth: 300,
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: InkWell(
            splashFactory: NoSplash.splashFactory,
            overlayColor: MaterialStatePropertyAll(Colors.transparent),
            enableFeedback: false,
            onTap: () => _routerService.replaceWithHomeView(),
            child: SvgPicture.asset(
              'assets/images/monad_white.svg',
              height: 55,
              fit: BoxFit.fitHeight,
              width: 555,
            ),
          ),
        ),
        actions: [
          OutlinedButton(
            style: const ButtonStyle(
              side: MaterialStatePropertyAll(BorderSide.none),
              backgroundColor: MaterialStatePropertyAll(Colors.black45),
            ),
            onPressed: () => _routerService.replaceWithHomeView(),
            child: const Text(
              "Memes",
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          OutlinedButton(
            onPressed: () {},
            style: const ButtonStyle(
              side: MaterialStatePropertyAll(BorderSide.none),
              backgroundColor: MaterialStatePropertyAll(Colors.black45),
            ),
            child: const Text(
              "News",
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          OutlinedButton(
            onPressed: () {},
            style: const ButtonStyle(
              side: MaterialStatePropertyAll(BorderSide.none),
              backgroundColor: MaterialStatePropertyAll(Colors.black45),
            ),
            child: const Text(
              "Social",
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          OutlinedButton(
            onPressed: () {},
            style: const ButtonStyle(
              side: MaterialStatePropertyAll(BorderSide.none),
              backgroundColor: MaterialStatePropertyAll(Colors.black45),
            ),
            child: const Text(
              "Team",
              style: TextStyle(color: monadElectricIce),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          OutlinedButton(
            onPressed: () => _routerService.replaceWithAboutView(),
            style: const ButtonStyle(
              side: MaterialStatePropertyAll(BorderSide.none),
              backgroundColor: MaterialStatePropertyAll(Colors.black45),
            ),
            child: const Text(
              "About",
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(
            width: 25,
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/images/gradient_back.png", fit: BoxFit.fill),
          SingleChildScrollView(
            child: SizedBox(
              height: 5555,
              child: Column(
                children: [
                  /*      const SizedBox(height: 50,), */
                  SizedBox(
                    height: 555,
                    width: MediaQuery.sizeOf(context).width,
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[
                            Colors.black
                                .withOpacity(0.6), // Orta kısım yarı şeffaf
                            Colors.transparent, // Alt kısım tamamen şeffaf
                          ],
                          stops: const [0.5, 0.95], // Renklerin geçiş noktaları
                        ).createShader(bounds);
                      },
                      blendMode: BlendMode.dstIn, // Şeffaflık efektini uygula
                      child: Image.asset(
                        'assets/images/team_background.jpg', // Fotoğrafınızın yolu
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "The Team",
                            style: TextStyle(color: Colors.white, fontSize: 55),
                          ),
                          SizedBox(
                            width: 1060,
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              direction: Axis.horizontal,
                              children: [
                                UserWidget(
                                    name: "Keone Hon",
                                    descp: "CO-FOUNDER & CEO",
                                    image: "assets/images/team/keone.jpeg",
                                    instaLink: "",
                                    instaName: "",
                                    location: "New York, USA",
                                    twitterLink: "https://twitter.com/keoneHD",
                                    twitterUserName: "@keoneHD"),
                                UserWidget(
                                    name: "James Hunsaker",
                                    descp: "CO-FOUNDER & CTO",
                                    image: "assets/images/team/james.png",
                                    instaLink: "",
                                    instaName: "",
                                    location: "New York, USA",
                                    twitterLink:
                                        "https://twitter.com/_jhunsaker",
                                    twitterUserName: "@_jhunsaker"),
                                UserWidget(
                                    name: "Eunice Giarta",
                                    descp: "CO-FOUNDER & COO",
                                    image: "assets/images/team/eunice.jpg",
                                    instaLink: "",
                                    instaName: "",
                                    location: "New York, USA",
                                    twitterLink:
                                        "https://twitter.com/0x_eunice",
                                    twitterUserName: "@0x_eunice"),
                                /* UserWidget(
                                    name: "",
                                    descp: "",
                                    image: "",
                                    instaLink: "",
                                    instaName: "",
                                    location: "",
                                    twitterLink: "",
                                    twitterUserName: ""),
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
                                    twitterUserName: ""), */
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
          ),
        ],
      ),
    );
  }
}
