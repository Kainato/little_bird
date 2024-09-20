import 'package:flutter/material.dart';

class Gallery {
  BuildContext context;
  Gallery(this.context);

  String get imagotipo {
    return Theme.of(context).brightness == Brightness.dark
        ? 'assets/branding/alternatives/imagotipo_alternativo.png'
        : 'assets/branding/original/imagotipo.png';
  }

  String get isologo {
    return Theme.of(context).brightness == Brightness.dark
        ? 'assets/branding/alternatives/isologo_alternativo.png'
        : 'assets/branding/original/isologo.png';
  }

  String get isotipo {
    return Theme.of(context).brightness == Brightness.dark
        ? 'assets/branding/alternatives/isotipo_alternativo.png'
        : 'assets/branding/original/isotipo.png';
  }

  String get isotipoTransparente {
    return Theme.of(context).brightness == Brightness.dark
        ? 'assets/branding/alternatives/isotipo_alternativo_transparente.png'
        : 'assets/branding/original/isotipo_transparente.png';
  }

  String get logotipoHorizontal {
    return Theme.of(context).brightness == Brightness.dark
        ? 'assets/branding/alternatives/logotipo_horizontal_alternativo.png'
        : 'assets/branding/original/logotipo_horizontal.png';
  }

  String get logotipoVertical {
    return Theme.of(context).brightness == Brightness.dark
        ? 'assets/branding/alternatives/logotipo_vertical_alternativo.png'
        : 'assets/branding/original/logotipo_vertical.png';
  }
}
