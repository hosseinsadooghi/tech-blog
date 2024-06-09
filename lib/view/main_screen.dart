import 'package:flutter/material.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/my_colors.dart';
import 'package:tech_blog/view/home_screen.dart';
import 'package:tech_blog/view/profile_screen.dart';
import 'package:tech_blog/view/sign_up_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    var marginFromSide = size.width / 12.46;

    return Scaffold(
      //bar
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyColors.scafoldBackGround,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //menu button
            const Icon(
              Icons.menu,
              color: MyColors.appBarIcons,
            ),
            //tech blog logo
            SizedBox(
              height: size.height / 13.6,
              child: Assets.images.logo.image(),
            ),
            //search
            const Icon(
              Icons.search,
              color: MyColors.appBarIcons,
            )
          ],
        ),
      ),
      //body
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
                child: IndexedStack(
              index: selectedPageIndex,
              children: [
                HomeScreen(
                    size: size,
                    textTheme: textTheme,
                    marginFromSide: marginFromSide),
                SignUpPage(
                    size: size,
                    textTheme: textTheme,
                    marginFromSide: marginFromSide),
                ProfileScreen(
                    size: size,
                    textTheme: textTheme,
                    marginFromSide: marginFromSide)
              ],
            )),
            //nav bar
            BottomNavigation(
              size: size,
              changeScreen: (int value) {
                setState(() {
                  selectedPageIndex = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavigation extends StatefulWidget {
  BottomNavigation({
    super.key,
    required this.size,
    required this.changeScreen,
  });

  final Size size;
  final Function(int) changeScreen;

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  var selectedNavBarIcon = 0;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Stack(children: [
        //fade part
        Container(
          height: widget.size.height / 10,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: GradientColors.bottomNavBackGround,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        ),
        //nav container
        Align(
          alignment: Alignment.center,
          child: Container(
            height: widget.size.height / 12.35,
            width: widget.size.width / 1.37,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(18)),
                gradient: LinearGradient(
                  colors: GradientColors.bottomNav,
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //home screen
                IconButton(
                    onPressed: (() {
                      widget.changeScreen(0);
                      selectedNavBarIcon = 0;
                    }),
                    icon: ImageIcon(
                      Assets.icons.home.provider(),
                      color: selectedNavBarIcon == 0 ? MyColors.navBarActivatedIcons : MyColors.navBarIcons,
                    )),
                //sign in
                IconButton(
                    onPressed: (() {
                      widget.changeScreen(1);
                      selectedNavBarIcon = 1;
                    }),
                    icon: ImageIcon(
                      Assets.icons.write.provider(),
                      color: selectedNavBarIcon == 1 ? MyColors.navBarActivatedIcons : MyColors.navBarIcons,
                    )),
                //profile scrren
                IconButton(
                    onPressed: (()  {
                      widget.changeScreen(2);
                      selectedNavBarIcon = 2;
                    }),
                    icon: ImageIcon(
                      Assets.icons.user.provider(),
                      color: selectedNavBarIcon == 2 ? MyColors.navBarActivatedIcons : MyColors.navBarIcons,
                    )),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
