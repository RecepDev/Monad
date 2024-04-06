import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:monad/app/app.router.dart';
import 'package:monad/ui/common/app_colors.dart';
import 'package:monad/ui/common/app_constants.dart';
import 'package:provider/provider.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../extensions/Provider/monadProvider.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar(
      {super.key,
      required RouterService routerService,
      required this.appBar,
      required this.pageNames})
      : _routerService = routerService;

  final RouterService _routerService;
  final AppBar appBar;
  final PageNames pageNames;

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
          onTap: () {
            _routerService.replaceWithHomeView();
            context.read<MonadProvider>().changeSkeletonTwice(true);
          },
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
          onPressed: () {
            _routerService.replaceWithHomeView();
            context.read<MonadProvider>().changeSkeletonTwice(true);
          },
          child: Text(
            "Memes",
            style: TextStyle(
                color: pageNames == PageNames.memes
                    ? monadElectricIce
                    : monadWhiteRabbit),
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
          child: Text(
            "News",
            style: TextStyle(
                color: pageNames == PageNames.news
                    ? monadElectricIce
                    : monadWhiteRabbit),
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
          child: Text(
            "Social",
            style: TextStyle(
                color: pageNames == PageNames.social
                    ? monadElectricIce
                    : monadWhiteRabbit),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        OutlinedButton(
          onPressed: () {
            _routerService.replaceWithTeamView();
            context.read<MonadProvider>().changeSkeleton(true);
          },
          style: const ButtonStyle(
            side: MaterialStatePropertyAll(BorderSide.none),
            backgroundColor: MaterialStatePropertyAll(Colors.black45),
          ),
          child: Text(
            "Team",
            style: TextStyle(
                color: pageNames == PageNames.team
                    ? monadElectricIce
                    : monadWhiteRabbit),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        OutlinedButton(
          onPressed: () {
            _routerService.replaceWithAboutView();
            context.read<MonadProvider>().changeSkeleton(true);
          },
          style: const ButtonStyle(
            side: MaterialStatePropertyAll(BorderSide.none),
            backgroundColor: MaterialStatePropertyAll(Colors.black45),
          ),
          child: Text(
            "About",
            style: TextStyle(
                color: pageNames == PageNames.about
                    ? monadElectricIce
                    : monadWhiteRabbit),
          ),
        ),
        const SizedBox(
          width: 25,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
