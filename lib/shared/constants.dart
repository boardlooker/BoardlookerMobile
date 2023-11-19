import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {
  static final apiUrl = dotenv.get('API_URL', fallback: '');

  static const defaultListSize = 1000000;

  static const dbName = "boardlooker_db";
}
