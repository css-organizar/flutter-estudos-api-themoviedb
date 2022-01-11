import 'package:desafio_gabriel/presentation/movies_dashboard/movies_dashboard_controller.dart';
import 'package:get/get.dart';

class MoviesDashboadBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<MoviesDashboardContoller>(
      MoviesDashboardContoller(),
      permanent: false,
    );
  }
}
