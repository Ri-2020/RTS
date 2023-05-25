import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rts/constants/colors.dart';
import 'package:rts/constants/textstyles.dart';
import 'package:rts/utils/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: const ScrollBehavior(
          androidOverscrollIndicator: AndroidOverscrollIndicator.stretch),
      // darkTheme: darkThemeData(context),
      theme: ThemeConfig.lightTheme,
      // themeMode: ThemeMode.system,

      // home: HomeView(),
      // home: const Signin(),
      initialRoute: AppRotutes.mainHome,
      getPages: AppRotutes.pages,
      // home: OnboardingScreen(),
    );
  }
}

// class HomeView extends StatelessWidget {
//   const HomeView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Center(child: Text("hii")));
//   }
// }

ThemeData darkThemeData(BuildContext context) {
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColor: Colors.white,
    colorScheme: const ColorScheme.dark(),
    indicatorColor: Colors.white,
    splashColor: Colors.white24,
    splashFactory: InkRipple.splashFactory,
    // accentColor: kPrimaryColor,
    // fontFamily: "WorkSans",
    // fontFamily: "Poppins",
    shadowColor: Theme.of(context).disabledColor,
    dividerColor: const Color(0xff707070),
    canvasColor: Colors.white70,
    backgroundColor: Colors.black,
    // errorColor: kErrorColor,
    textTheme: const TextTheme(
      headline1: TextStyles.h1Heading,
      // bodyText1: TextStyles.pageHeading,
      // bodyText2: TextStyles.pageSubHeading,
      // subtitle1: TextStyles.h1SubHeading,
      labelMedium: TextStyles.subText,
    ),
    // primaryTextTheme: getTextTheme(),
    // accentTextTheme: getTextTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
