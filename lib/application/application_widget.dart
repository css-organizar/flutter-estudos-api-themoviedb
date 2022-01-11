import 'package:desafio_gabriel/application/application_pages.dart';
import 'package:desafio_gabriel/application/themes/application_themes.dart';
import 'package:desafio_gabriel/presentation/movies_dashboard/movies_dashboard_view.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ApplicationWidget extends StatefulWidget {
  const ApplicationWidget({Key? key}) : super(key: key);

  @override
  _ApplicationWidgetState createState() => _ApplicationWidgetState();
}

class _ApplicationWidgetState extends State<ApplicationWidget> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ApplicationTheme.lightTheme,
      getPages: ApplicationPager.routes,
      initialRoute: ApplicationPager.initialRoute,
    );
  }
}
