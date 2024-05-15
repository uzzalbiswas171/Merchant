import 'package:e_currier/N_View/Profile/profile.dart';
import 'package:e_currier/N_View/Profile/receiverProfile.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import 'N_Statemanagement/e_currier_provider.dart';
import 'N_View/HomeScreen/trackparcel.dart';
import 'N_View/Splash/splash1.dart';
import 'N_View/Splash/splash_screen.dart';
import 'N_View/Splash/splashpageview.dart';


void main()async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<E_Currier_Provierd>(create: (context) => E_Currier_Provierd(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
   home: SplashScreen(),
      ),
    );
  }
}
