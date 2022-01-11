import 'package:desafio_gabriel/domain/models/genres.dart';
import 'package:desafio_gabriel/domain/models/movie_data.dart';
import 'package:desafio_gabriel/infrastructure/services/movies/movies_service.dart';
import 'package:get/get.dart';

class MoviesDashboardContoller extends GetxController {
  final _selectedGenre = 28.obs;
  final _isLoading = false.obs;
  final RxList<Movies> _listaFilmes = RxList<Movies>();
  List<Genres> genresList = <Genres>[];

  get selectedGenre => _selectedGenre.value;
  set selectedGenre(value) => _selectedGenre.value = value;

  get isLoading => _isLoading.value;
  set isLoading(value) => _isLoading.value = value;

  List<Movies> get listaFilmes => _listaFilmes;

  setSelectedGenre(int value) {
    selectedGenre = value;
  }

  listarGeneros() async {
    var listaDeGeneros = await Get.find<MoviesService>().getGenres();
    genresList.clear();
    genresList.addAll(listaDeGeneros!.genres as List<Genres>);
    print(listaDeGeneros);
  }

  String substituirListaGeneros(List<int>? list) {
    String concatenate = '';
    for (var item in list!) {
      concatenate += (genresList.firstWhere((element) => element.id == item).name ?? '');
      concatenate += ' - ';
    }
    concatenate = concatenate.substring(0, concatenate.length - 3);
    return concatenate;
  }

  listarFilmes({int genreId = 28}) async {
    isLoading = true;
    var listaDeFilmes = await Get.find<MoviesService>().getTopMovies(page: 1);

    _listaFilmes.clear();
    if (listaDeFilmes!.results!.isNotEmpty) {
      if (genreId != 0) {
        var aux = listaDeFilmes.results!.where(
          (p0) => p0.genreIds!.contains(genreId),
        );
        _listaFilmes.addAll(aux);
      } else {
        _listaFilmes.addAll(listaDeFilmes.results as List<Movies>);
      }
    }
    isLoading = false;
  }

  @override
  void onInit() async {
    await listarGeneros();
    await listarFilmes();
    super.onInit();
  }
}
