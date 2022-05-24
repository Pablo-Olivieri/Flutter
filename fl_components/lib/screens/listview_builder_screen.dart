import 'package:flutter/material.dart';

class ListViewBuilderScreen extends StatefulWidget {
  const ListViewBuilderScreen({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderScreen> createState() => _ListViewBuilderScreenState();
}

class _ListViewBuilderScreenState extends State<ListViewBuilderScreen> {
  final List<int> imagesIds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      // print( ' ${scrollController.position.pixels}, ${scrollController.position.maxScrollExtent}'); //para saber del scroll controler, la posicion, los pixeles, etc.
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        add5();
      }
      /* esto de arriba fue para poner que si el scroll controller pixel (que es la ubicacion actual) le sumamos unos 500 pts de gracia
   si eso, es mayor o igual al scroll controller position maxextent (que es lo maximo que se va a estirar)
   , si esa condicion se cumple, que agregue 5 mas... es decir que cargue las proximas 5 imagenes y asi sucesivamente */
    });
  }

  void add5() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) =>
            lastId +
            e) //esto es para ir cargando de a 5 imagenes antes de llegar al final y hacer un scroll infinito
        );
    setState(() {});
  }

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(
        seconds: 2)); //esperamos 2 segundos para tener el loading
    final lastId = imagesIds.last;
    imagesIds.clear(); //llamamos a esta instruccion que limpia nuestro listado
    imagesIds.add(lastId +
        1); //tomamos el ultimo listado y le asignamos 5 registros nuevos
    add5();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true, //de esta manera saco el espacio blanco del notch
        removeBottom:
            true, // saco la parte blanca de abajo de todo cuando no hay mas fotos por mostrar
        child: RefreshIndicator(
          onRefresh: onRefresh,
          child: ListView.builder(
            controller:
                scrollController, //esto es para tener un control de las cantidades de imagenes de nuestro listview
            itemCount: imagesIds.length,
            itemBuilder: (BuildContext context, int index) {
              return FadeInImage(
                  width: double.infinity, //que tome todo el ancho posible
                  height: 300,
                  fit: BoxFit
                      .cover, //para que tome todo el espacio de la imagen y no queden espacios entre una y otra
                  placeholder: const AssetImage('assets/jar-loading.gif'),
                  image: NetworkImage(
                      'https://picsum.photos/500/300?image=${imagesIds[index]}'));
            },
          ),
        ),
      ),
    );
  }
}
