import 'package:desafio_gabriel/application/application_routes.dart';
import 'package:desafio_gabriel/presentation/movies_dashboard/movies_dashboard_bidings.dart';
import 'package:desafio_gabriel/presentation/movies_dashboard/movies_dashboard_view.dart';
import 'package:get/get.dart';

class ApplicationPager {
  static const initialRoute = ApplicationRoutes.moviesDashboard;

  static final routes = [
    GetPage(
      name: ApplicationRoutes.moviesDashboard,
      page: () {
        return MoviesDashboardView();
      },
      binding: MoviesDashboadBinding(),
    ),
  ];
}
