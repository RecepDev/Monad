import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glass/glass.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monad/app/app.locator.dart';
import 'package:monad/app/app.router.dart';
import 'package:monad/ui/common/app_colors.dart';
import 'package:monad/ui/common/app_constants.dart';
import 'package:monad/ui/widgets/bottombar_widget.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../widgets/appbar_widget.dart';
import 'about_viewmodel.dart';

class AboutViewDesktop extends StatefulWidget {
  const AboutViewDesktop({super.key});

  @override
  State<AboutViewDesktop> createState() => _AboutViewDesktopState();
}

class _AboutViewDesktopState extends State<AboutViewDesktop> {
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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MyAppBar(
        appBar: AppBar(),
        routerService: _routerService,
        pageNames: PageNames.about,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/images/gradient_back.png", fit: BoxFit.fill),
          ImprovedScrolling(
            scrollController: _controller,
            enableMMBScrolling: true,
            mmbScrollConfig: MMBScrollConfig(

                // İsteğe bağlı olarak kaydırma davranışını özelleştirin
                ),
            child: SingleChildScrollView(
              controller: _controller,
              child: Container(
                height: 2222,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      alignment: Alignment.center,
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
                              'assets/images/about_background.jpg', // Fotoğrafınızın yolu
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 222),
                          child: Center(
                            child: Column(
                              children: [
                                Text(
                                  "Extreme Parallelized",
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 33,
                                    color: monadWhiteRabbit,
                                  ),
                                )
                                    .animate()
                                    .fade(duration: Duration(milliseconds: 444))
                                    .moveY(begin: 50, end: 0),
                                Text(
                                  "Performance",
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 33,
                                    color: monadWhiteRabbit,
                                  ),
                                )
                                    .animate()
                                    .fade(duration: Duration(milliseconds: 444))
                                    .moveY(begin: 50, end: 0),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Superscalar Pipelining for the EVM",
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 22,
                                    color: monadWhiteRabbit,
                                  ),
                                )
                                    .animate()
                                    .fade(duration: Duration(milliseconds: 444))
                                    .moveY(begin: 50, end: 0),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Monad is a decentralized, developer-forward Layer 1 smart contract platform that ushers \r in a new paradigm of possibility through pipelined execution of Ethereum transactions.",
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: monadWhiteRabbit,
                                  ),
                                )
                                    .animate()
                                    .fade(duration: Duration(milliseconds: 444))
                                    .moveY(begin: 50, end: 0),
                                SizedBox(
                                  height: 11,
                                ),
                                Text(
                                  "Crafted for productivity, fundamentally optimized.",
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: monadWhiteRabbit,
                                  ),
                                )
                                    .animate()
                                    .fade(duration: Duration(milliseconds: 444))
                                    .moveY(begin: 50, end: 0),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Wrap(
                      runSpacing: 33,
                      spacing: 33,
                      direction: Axis.horizontal,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      alignment: WrapAlignment.start,
                      children: [
                        Container(
                          width: 500,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(10, 10), color: Colors.black12)
                            ],
                            borderRadius: BorderRadius.circular(22),
                            border: Border.all(
                                color: monadWhiteRabbit.withOpacity(0.13)),
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  //begin color
                                  monadWhiteRabbit.withOpacity(0.04),
                                  //end color
                                  monadWhiteRabbit.withOpacity(0.03),
                                ]),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(22),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Decentralization Meets Scale",
                                      style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 22,
                                        color: monadWhiteRabbit,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Monad supports 10,000 transactions per second, significantly increasing throughput capabilities and opening doors for distributed applications--even those with greater complexity and higher usage--to run in a decentralized manner.",
                                      style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        color: monadWhiteRabbit,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 500,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(10, 10), color: Colors.black12)
                            ],
                            borderRadius: BorderRadius.circular(22),
                            border: Border.all(
                                color: monadWhiteRabbit.withOpacity(0.13)),
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  //begin color
                                  monadWhiteRabbit.withOpacity(0.04),
                                  //end color
                                  monadWhiteRabbit.withOpacity(0.03),
                                ]),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(22),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Superscalar Architecture",
                                      style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 22,
                                        color: monadWhiteRabbit,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Existing blockchains are extremely slow by modern computing standards. Monad is built with performance in mind, bridging the gap between decentralized and traditional platforms through superscalar, pipelined execution and optimized architecture.",
                                      style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        color: monadWhiteRabbit,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 500,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(10, 10), color: Colors.black12)
                            ],
                            borderRadius: BorderRadius.circular(22),
                            border: Border.all(
                                color: monadWhiteRabbit.withOpacity(0.13)),
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  //begin color
                                  monadWhiteRabbit.withOpacity(0.04),
                                  //end color
                                  monadWhiteRabbit.withOpacity(0.03),
                                ]),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(22),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Portability & Core Composability",
                                      style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 22,
                                        color: monadWhiteRabbit,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Monad preserves full compatibility with EVM bytecode and the Ethereum RPC API--which means seamless portability for EVM developers who account for 98% of on-chain TVL across all ecosystems.  Supporting all of this in a single shard allows for powerful, composable applications built on top of a global store of truth.",
                                      style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        color: monadWhiteRabbit,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                        .animate()
                        .fade(
                            duration: Duration(milliseconds: 444),
                            delay: Duration(milliseconds: 444))
                        .moveY(begin: 50, end: 0),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
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
