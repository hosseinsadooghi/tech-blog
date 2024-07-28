import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/component/my_colors.dart';
import 'package:tech_blog/component/my_strings.dart';
import 'package:tech_blog/view/home_screen.dart';
import 'package:tech_blog/view/profile_screen.dart';
import 'package:tech_blog/view/register_bot.dart';


final GlobalKey<ScaffoldState> _key = GlobalKey();

class MainScreen extends StatelessWidget {

  MainScreen ({Key?key}):super();

  RxInt selectedPageIndex = 0.obs;
  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: MyColors.statusBarColor,
        systemNavigationBarColor: MyColors.navigationBarColor,
        systemNavigationBarIconBrightness: Brightness.dark));
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    var marginFromSide = size.width / 12.46;

    return SafeArea(

      child: Scaffold(
        key: _key,
        //drawer
        drawer: Drawer(
            backgroundColor: MyColors.scafoldBackGround,
            child: Padding(
              padding:
                  EdgeInsets.only(left: marginFromSide, right: marginFromSide),
              child: ListView(
                children: [
                  //drawer header
                  DrawerHeader(
                    child: Center(
                      child: Image.asset(
                        Assets.images.logo.path,
                        scale: 3,
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: Divider.createBorderSide(context,
                            color: MyColors.divider, width: 1.0),
                      ),
                    ),
                  ),
                  //user profile
                  ListTile(
                    title: Text(
                      MyStrings.drawerTitles[0],
                      style: textTheme.labelMedium,
                    ),
                    onTap: () {},
                  ),
                  //divider
                  const Divider(
                    color: MyColors.divider,
                  ),
                  //about tech blog
                  ListTile(
                    title: Text(
                      MyStrings.drawerTitles[1],
                      style: textTheme.labelMedium,
                    ),
                    onTap: () {},
                  ),
                  //divider
                  const Divider(
                    color: MyColors.divider,
                  ),
                  //sharing tech blog
                  ListTile(
                    title: Text(
                      MyStrings.drawerTitles[2],
                      style: textTheme.labelMedium,
                    ),
                    onTap: () {},
                  ),
                  //divider
                  const Divider(
                    color: MyColors.divider,
                  ),
                  //tech blog git hub
                  ListTile(
                    title: Text(
                      MyStrings.drawerTitles[3],
                      style: textTheme.labelMedium,
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            )),
        //bar
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: MyColors.scafoldBackGround,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //menu button
              InkWell(
                onTap: () {
                    _key.currentState!.openDrawer();
                  
                },
                child: const Icon(
                  Icons.menu,
                  color: MyColors.appBarIcons,
                ),
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
                  child: Obx(()=>IndexedStack(
                index: selectedPageIndex.value,
                children: [
                  HomeScreen(),
                  RegisterBot(),
                  ProfileScreen()
                ],
              ))
              ),
              //nav bar
              BottomNavigation(
                size: size,
                changeScreen: (int value) {
                    selectedPageIndex.value = value;
                  
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  BottomNavigation({
    super.key,
    required this.size,
    required this.changeScreen,
  });

  final Size size;
  final Function(int) changeScreen;

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
          height: size.height / 10,
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
            height: size.height / 12.35,
            width: size.width / 1.37,
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
                      changeScreen(0);
                      selectedNavBarIcon = 0;
                    }),
                    icon: ImageIcon(
                      Assets.icons.home.provider(),
                      color: selectedNavBarIcon == 0
                          ? MyColors.navBarActivatedIcons
                          : MyColors.navBarIcons,
                    )),
                //sign up
                IconButton(
                    onPressed: (() {
                      changeScreen(1);
                      selectedNavBarIcon = 1;
                    }),
                    icon: ImageIcon(
                      Assets.icons.write.provider(),
                      color: selectedNavBarIcon == 1
                          ? MyColors.navBarActivatedIcons
                          : MyColors.navBarIcons,
                    )),
                //profile scrren
                IconButton(
                    onPressed: (() {
                      changeScreen(2);
                      selectedNavBarIcon = 2;
                    }),
                    icon: ImageIcon(
                      Assets.icons.user.provider(),
                      color: selectedNavBarIcon == 2
                          ? MyColors.navBarActivatedIcons
                          : MyColors.navBarIcons,
                    )),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

