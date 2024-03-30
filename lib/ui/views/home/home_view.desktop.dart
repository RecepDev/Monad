import 'dart:async';
import 'dart:html';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:monad/app/app.router.dart';
import 'package:monad/extensions/bloc/bloc/memes_bloc_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'dart:ui_web' as ui;
import '../../../app/app.locator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../models/discord_message_model.dart';
import '../../common/app_colors.dart';
import 'home_viewmodel.dart';

class HomeViewDesktop extends StatefulWidget {
  const HomeViewDesktop({super.key});

  @override
  State<HomeViewDesktop> createState() => _HomeViewDesktopState();
}

class _HomeViewDesktopState extends State<HomeViewDesktop> {
  final _routerService = locator<RouterService>();
  FirebaseFirestore db = FirebaseFirestore.instance;
  late ScrollController _controller;
  bool isSkeleteonWorking = true;
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
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
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
              style: TextStyle(color: monadElectricIce),
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
            controller: _controller,
            child: Container(
              height: 3610,
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
                  /*  Container(
                    height: 500,
                    width: 500,
                    padding: EdgeInsets.all(20.0),
                    child: HtmlElementView(
                      viewType: "twitter",
                    ),
                  ), */
                  SizedBox(
                    height: 50,
                  ),
                  BlocBuilder<MemesBloc, MemesBlocState>(
                    builder: (context, state) {
                      if (state is BlocInitial) {
                        return Center();
                      } else if (state is BlocDataLoaded) {
                        var listOfMemes = state.listOfMemes;

                        print("çalışıyor");
                        if (isSkeleteonWorking == true) {
                          Future.delayed(
                            Duration(seconds: 1),
                            () {
                              setState(() {
                                isSkeleteonWorking = false;
                              });
                            },
                          );
                        }

                        return Skeletonizer(
                          effect: ShimmerEffect(
                              highlightColor: monadWine, baseColor: monadBlue),
                          enabled: isSkeleteonWorking,
                          child: GridViewWidget(
                            isSkeleteonWorking: isSkeleteonWorking,
                            listOfMemes: listOfMemes,
                            controller: _controller,
                          ),
                        );
                      }
                      return Center();
                    },
                  )
                ],
              ),
            ),
          )
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
    required this.isSkeleteonWorking,
  });

  List listOfMemes;
  ScrollController controller;
  bool isSkeleteonWorking;

  @override
  State<GridViewWidget> createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  List<int> pageNumbers = [1, 2];
  List<List<dynamic>> newList = [];
  @override
  void initState() {
    super.initState();
    newList = listeyiBol(widget.listOfMemes, 50);
    /*  if (widget.listOfMemes.length > 50) {}
    for (var i = 0; i < widget.listOfMemes.length; i++) {} */
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
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: MasonryGridView.count(
                shrinkWrap: true,
                crossAxisCount: 6,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                itemCount: throwBackListLength(newList),
                itemBuilder: (context, index) {
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
                                setState(() {
                                  widget.isSkeleteonWorking = true;
                                  widget.controller.animateTo(
                                    600, // Başlangıç noktasına scroll yapar
                                    curve: Curves.easeOut,
                                    duration: const Duration(milliseconds: 500),
                                  );
                                  widget.listOfMemes = newList[index];
                                });
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
      ),
    );
  }

  throwBackListLength(List<List<dynamic>> liste) {
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


