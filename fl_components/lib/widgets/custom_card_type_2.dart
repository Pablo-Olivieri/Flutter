import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomCardType2 extends StatelessWidget {
  final String imageUrl;
  final String? name;

  const CustomCardType2({Key? key, required this.imageUrl, this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias, //esto redondea los bordes de la imagen
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              18)), //de esta manera elegis cuan redondeado queres las esquinas
      elevation: 30,
      shadowColor: AppTheme.primary.withOpacity(0.5), //dar sombra a la tarjeta
      child: Column(
        children: [
          FadeInImage(
            image: NetworkImage(imageUrl),

            placeholder: const AssetImage('assets/jar-loading.gif'),
            width: double.infinity, // para que use todo el ancho disponible
            height: 230,
            fit: BoxFit.cover,
            fadeInDuration: const Duration(milliseconds: 300),
          ),
          if (name !=
              null) //si el name es diferente de null, construye ese container

            Container(
                alignment: AlignmentDirectional.centerEnd,
                padding: EdgeInsets.only(right: 20, top: 10, bottom: 10),
                child: Text(name!)),
        ],
      ),
    );
  }
}
