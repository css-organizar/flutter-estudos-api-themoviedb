import 'package:desafio_gabriel/application/application_widget.dart';
import 'package:desafio_gabriel/infrastructure/services/movies/movies_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put<RouteObserver>(
    RouteObserver<PageRoute>(),
    permanent: true,
  );

  Get.put<MoviesService>(
    MoviesService(),
    permanent: true,
  );

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ApplicationWidget(),
    ),
  );
}
