import 'package:get/get.dart';

class MoviesDashboardContoller extends GetxController {
  final _selectedGenre = 28.obs;

  get selectedGenre => _selectedGenre.value;
  set selectedGenre(value) => _selectedGenre.value = value;

  setSelectedGenre(int value) {
    selectedGenre = value;
  }
}
