import 'dart:async';
import 'dart:html';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monad/app/app.router.dart';
import 'package:monad/extensions/bloc/bloc/memes_bloc_bloc.dart';
import 'package:monad/ui/common/app_constants.dart';
import 'package:monad/ui/widgets/bottombar_widget.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart' as skeleton;
import 'package:stacked_services/stacked_services.dart';
import 'dart:ui_web' as ui;
import '../../../app/app.locator.dart';
import '../../../extensions/Provider/monadProvider.dart';
import '../../common/app_colors.dart';
import '../../widgets/appbar_widget.dart';

class HomeViewDesktop extends StatefulWidget {
  const HomeViewDesktop({super.key});

  @override
  State<HomeViewDesktop> createState() => _HomeViewDesktopState();
}

class _HomeViewDesktopState extends State<HomeViewDesktop> {
  final _routerService = locator<RouterService>();
  FirebaseFirestore db = FirebaseFirestore.instance;
  late ScrollController _controller;
  /*  String _counter = "0";
  int _currentTime = 5; */

  @override
  void initState() {
    super.initState();
    context.read<MemesBloc>().add(BlocLoadData());
    _controller = ScrollController();
    /* _startCountdown();
    fetchPhotosFromDiscordChannel(); */
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

/*  || message['embeds'].isNotEmpty */
  /*  void chechCount() {} */

  /*  void _startCountdown() {
    const interval = const Duration(seconds: 1);
    Timer.periodic(interval, (Timer T) {
      setState(() {
        if (_currentTime > 0) {
          _currentTime -= 1;
        } else {
          _currentTime = 5;
          chechCount();
        }
      });
    });
  } */

  @override
  Widget build(BuildContext context) {
    print("homepagestate");
    ui.platformViewRegistry.registerViewFactory(
      'twitter',
      (int uid) {
        IFrameElement _iFrame = IFrameElement()..src = "assets/twitter.html";
        _iFrame.style.border = "none";
        _iFrame.style.overflow = "no";
        _iFrame.draggable = false;

        return _iFrame;
      },
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MyAppBar(
        appBar: AppBar(),
        routerService: _routerService,
        pageNames: PageNames.memes,
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
                constraints: BoxConstraints(minHeight: 2000),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    /*      const SizedBox(height: 50,), */
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
                              'assets/images/monad_home.jpg', // Fotoğrafınızın yolu
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
                                  "Memes",
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
                    /*  Container(
                      height: 500,
                      width: 500,
                      padding: EdgeInsets.all(20.0),
                      child: HtmlElementView(
                        viewType: "twitter",
                      ),
                    ), */

                    BlocBuilder<MemesBloc, MemesBlocState>(
                      builder: (context, state) {
                        if (state is BlocInitial) {
                          return Center();
                        } else if (state is BlocDataLoaded) {
                          print("blocloaded");
                          var listOfMemes = state.listOfMemes;

                          print("çalışıyor");
                          /*  if (isSkeleteonWorking == true) {
                            Future.delayed(
                              Duration(seconds: 1),
                              () {
                                setState(() {
                                  isSkeleteonWorking = false;
                                });
                              },
                            );
                          } */

                          return GridViewWidget(
                            listOfMemes: listOfMemes,
                            controller: _controller,
                          );
                        }
                        return Center();
                      },
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [BottomBar()],
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

class GridViewWidget extends StatefulWidget {
  GridViewWidget({
    super.key,
    required this.listOfMemes,
    required this.controller,
  });

  List listOfMemes;
  ScrollController controller;

  @override
  State<GridViewWidget> createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  List<int> pageNumbers = [1, 2];
  List<List<dynamic>> newList = [];
  late bool isFirstSkeletonWorking;
  bool atLaunch = true;

  @override
  void initState() {
    super.initState();
    /* if (atLaunch) {
    } else {
      if (context.read<MonadProvider>().isSkletonizerWorking == false) {
        isFirstSkeletonWorking = true;
      } else {
        isFirstSkeletonWorking = false;
      }
    } */

    Future.delayed(
      Duration(seconds: 2),
      () {
        context.read<MonadProvider>().changeSkeleton(false);
      },
    );
    newList = listeyiBol(widget.listOfMemes, 50);
    /*  if (widget.listOfMemes.length > 50) {}
    for (var i = 0; i < widget.listOfMemes.length; i++) {} */
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<List<dynamic>> listeyiBol(List<dynamic> orijinalListe, int bolumBoyutu) {
    List<List<dynamic>> yeniListe = [];
    for (int i = 0; i < orijinalListe.length; i += bolumBoyutu) {
      yeniListe.add(orijinalListe.sublist(
          i,
          i + bolumBoyutu > orijinalListe.length
              ? orijinalListe.length
              : i + bolumBoyutu));
    }
    return yeniListe;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 55),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: Consumer<MonadProvider>(
              builder: (context, provider, child) {
                return skeleton.Skeletonizer(
                  effect: skeleton.ShimmerEffect(
                      highlightColor: monadWine, baseColor: monadBlue),
                  enabled: provider.isSkletonizerWorking,
                  child: MasonryGridView.count(
                    padding: EdgeInsets.all(0),
                    shrinkWrap: true,
                    crossAxisCount: 6,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    itemCount: throwBackListLength(newList),
                    itemBuilder: (context, index) {
                      /*    print(index);
                    if (index == 49) {
                      setState(() {
                        isSkeleteonWorking = false;
                      });
                    } */
                      return Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  /* boxShadow: [BoxShadow(blurRadius: 555)], */
                                  borderRadius: BorderRadius.circular(22)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(22),
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: widget.listOfMemes[index]["url"],
                                  placeholder: (context, url) => Center(
                                      /* child: CircularProgressIndicator() */),
                                  errorWidget: (context, url, error) {
                                    return Center(
                                      child: Icon(Icons.error),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                widget.listOfMemes[index]["username"],
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          Container(
            width: 200,
            child: SizedBox(
              width: 200,
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: newList.length,
                itemBuilder: (context, index) {
                  var pageNumber = index + 1;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 25,
                      width: 25,
                      child: Center(
                          child: ClipRRect(
                        borderRadius: BorderRadius.circular(22),
                        child: Material(
                          child: InkWell(
                            onTap: () {
                              widget.controller.animateTo(
                                500, // Başlangıç noktasına scroll yapar
                                curve: Curves.easeOut,
                                duration: const Duration(milliseconds: 500),
                              );
                              waitAndSetState();
      
                              widget.listOfMemes = newList[index];
                            },
                            child: Container(
                                width: 33,
                                height: 33,
                                color: Colors.white,
                                child: Center(
                                  child: Text(
                                    pageNumber.toString(),
                                    style: TextStyle(color: Colors.black),
                                  ),
                                )),
                          ),
                        ),
                      )),
                    ),
                  );
                },
              ),
            ),
          ),
          /* GridView.builder(
            shrinkWrap: true,
            itemCount: throwBackListLength(newList),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 6),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  decoration: BoxDecoration(
                      /* boxShadow: [BoxShadow(blurRadius: 555)], */
                      borderRadius: BorderRadius.circular(22)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(22),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: widget.listOfMemes[index]["url"],
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) {
                        return Center(
                          child: Icon(Icons.error),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),  */
        ],
      ),
    );
  }

  void waitAndSetState() async {
    await Future.delayed(
      Duration(milliseconds: 500),
      () {},
    );
    context.read<MonadProvider>().changeSkeleton(true);

    Future.delayed(
      Duration(milliseconds: 1500),
      () {
        context.read<MonadProvider>().changeSkeleton(false);
        setState(() {});
      },
    );
  }

  int throwBackListLength(List<List<dynamic>> liste) {
    if (widget.listOfMemes.length < 50) {
      return widget.listOfMemes.length;
    } else {
      return 50;
    }
  }
}

/* class HomeViewDesktopp extends ViewModelWidget<HomeViewModel> {
  const HomeViewDesktopp({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    final _routerService = locator<RouterService>();
    final WebViewController _controller = WebViewController();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
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
            onPressed: () {},
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
            onPressed: () {
              _routerService.replaceWithTeamView();
            },
            style: const ButtonStyle(
              side: MaterialStatePropertyAll(BorderSide.none),
              backgroundColor: MaterialStatePropertyAll(Colors.black45),
            ),
            child: const Text(
              "Team",
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
                        'assets/images/monad_home.jpg', // Fotoğrafınızın yolu
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  /* Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Team",
                            style: TextStyle(color: Colors.white, fontSize: 55),
                          ),
                          SizedBox(
                            width: 1060,
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              direction: Axis.horizontal,
                              children: [
                                UserWidget(
                                    name: "QuantumJackson",
                                    descp: "o bir maceracı",
                                    instaLink:
                                        "https://www.instagram.com/?hl=tr",
                                    instaName: "@Quandtms",
                                    location: "Istanbul, Ümraniye",
                                    twitterLink: "https://twitter.com/",
                                    twitterUserName: "@asdasdas"),
                                UserWidget(
                                    name: "QuantumJackson",
                                    descp: "o bir maceracı",
                                    instaLink:
                                        "https://www.instagram.com/?hl=tr",
                                    instaName: "@Quandtms",
                                    location: "Istanbul, Ümraniye",
                                    twitterLink: "https://twitter.com/",
                                    twitterUserName: "@asdasdas"),
                                UserWidget(
                                    name: "QuantumJackson",
                                    descp: "o bir maceracı",
                                    instaLink:
                                        "https://www.instagram.com/?hl=tr",
                                    instaName: "@Quandtms",
                                    location: "Istanbul, Ümraniye",
                                    twitterLink: "https://twitter.com/",
                                    twitterUserName: "@asdasdas"),
                                UserWidget(
                                    name: "QuantumJackson",
                                    descp: "o bir maceracı",
                                    instaLink:
                                        "https://www.instagram.com/?hl=tr",
                                    instaName: "@Quandtms",
                                    location: "Istanbul, Ümraniye",
                                    twitterLink: "https://twitter.com/",
                                    twitterUserName: "@asdasdas"),
                                UserWidget(
                                    name: "QuantumJackson",
                                    descp: "o bir maceracı",
                                    instaLink:
                                        "https://www.instagram.com/?hl=tr",
                                    instaName: "@Quandtms",
                                    location: "Istanbul, Ümraniye",
                                    twitterLink: "https://twitter.com/",
                                    twitterUserName: "@asdasdas"),
                                UserWidget(
                                    name: "QuantumJackson",
                                    descp: "o bir maceracı",
                                    instaLink:
                                        "https://www.instagram.com/?hl=tr",
                                    instaName: "@Quandtms",
                                    location: "Istanbul, Ümraniye",
                                    twitterLink: "https://twitter.com/",
                                    twitterUserName: "@asdasdas"),
                                UserWidget(
                                    name: "QuantumJackson",
                                    descp: "o bir maceracı",
                                    instaLink:
                                        "https://www.instagram.com/?hl=tr",
                                    instaName: "@Quandtms",
                                    location: "Istanbul, Ümraniye",
                                    twitterLink: "https://twitter.com/",
                                    twitterUserName: "@asdasdas"),
                                UserWidget(
                                    name: "QuantumJackson",
                                    descp: "o bir maceracı",
                                    instaLink:
                                        "https://www.instagram.com/?hl=tr",
                                    instaName: "@Quandtms",
                                    location: "Istanbul, Ümraniye",
                                    twitterLink: "https://twitter.com/",
                                    twitterUserName: "@asdasdas"),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ) */
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

 
} */
