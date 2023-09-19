import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:currency/config/config.dart';
import 'package:currency/app/providers.dart';
import 'package:currency/views/view.dart';

class AppModule extends StatelessWidget {
  const AppModule({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiProvider(
        providers: providers,
        child: MaterialApp(
          title: 'Currency',
          debugShowCheckedModeBanner: false,
          theme: appTheme,
          home: const HomePage(),
          scaffoldMessengerKey: AppSnackbar.scaffoldMessengerKey,
        ),
      );
    });
  }
}
