import 'dart:math';

class GeradorNumeroAleatorioService {
  static int gerarNumeroAleatorio() {
    Random numeroAleatorio = Random();
    return numeroAleatorio.nextInt(10);
  }
}
