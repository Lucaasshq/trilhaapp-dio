import 'package:hive/hive.dart';

class ConfiguracoesRepository {
  static late Box box;

  ConfiguracoesRepository._criar();

  static Future<ConfiguracoesRepository> carregar() async {
    if (Hive.isBoxOpen('configuracoes')) {
      box = Hive.box('configuracoes');
    } else {
      box = await Hive.openBox('configuracoes');
    }
    return ConfiguracoesRepository._criar();
  }
}
