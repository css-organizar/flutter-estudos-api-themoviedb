import 'package:desafio_gabriel/presentation/movies_dashboard/movies_dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'componentes/movie_banner_widget.dart';
import 'componentes/movie_genre_badge_widget.dart';

class MoviesDashboardView extends StatefulWidget {
  final String title = 'MoviesDashboardView';

  const MoviesDashboardView({Key? key}) : super(key: key);
  @override
  _MoviesDashboardViewState createState() => _MoviesDashboardViewState();
}

List<Map<String, dynamic>> genreList = [
  {
    'name': 'Ação',
    'code': 28,
  },
  {
    'name': 'Aventura',
    'code': 12,
  },
  {
    'name': 'Fantasia',
    'code': 14,
  },
  {
    'name': 'Comedia',
    'code': 35,
  },
];

class _MoviesDashboardViewState extends State<MoviesDashboardView> {
  MoviesDashboardContoller controller = Get.find<MoviesDashboardContoller>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Filmes',
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: 60,
                child: TextFormField(
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      // fontWeight: FontWeight.w600,
                    ),
                  ),
                  decoration: InputDecoration(
                    // label: Text('Pesquise filmes'),
                    filled: true,
                    hintText: 'Pesquise filmes',
                    contentPadding: EdgeInsets.all(0),
                    prefixIconColor: Colors.grey,
                    prefixIcon: Container(
                      margin: EdgeInsets.fromLTRB(15, 10, 10, 10),
                      child: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    ),
                    fillColor: Color.fromARGB(255, 241, 243, 245),
                    focusColor: Colors.red,
                    hoverColor: Colors.yellow,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                      borderSide: BorderSide(color: Color.fromARGB(255, 241, 243, 245)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                      borderSide: BorderSide(color: Color.fromARGB(255, 241, 243, 245)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                      borderSide: BorderSide(color: Color.fromARGB(255, 241, 243, 245)),
                    ),
                  ),
                ),
              ),
              Obx(
                () => Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: genreList.map(
                      (e) {
                        return MovieGenreBadgeWidget(
                          label: e['name'],
                          selected: (controller.selectedGenre == e['code']),
                          onTap: () {
                            controller.setSelectedGenre(e['code']);
                          },
                        );
                      },
                    ).toList(),
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: 5,
                  separatorBuilder: (context, i) {
                    return SizedBox(
                      height: 15,
                    );
                  },
                  itemBuilder: (context, i) {
                    return MovieBannerWidget();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
