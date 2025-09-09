import 'package:logger/logger.dart';

class EnvConfig {
  final String appName;
  final String burble_life_url;
  final String beat_brain_url;

  late final Logger logger;

  EnvConfig(
      {required this.appName,
      required this.burble_life_url,
      required this.beat_brain_url}) {
    logger = Logger(
      printer: PrettyPrinter(
          methodCount: 2,
          // number of method calls to be displayed
          errorMethodCount: 8,
          // number of method calls if stacktrace is provided
          lineLength: 120,
          // width of the output
          colors: true,
          // Colorful log messages
          printEmojis: true,
          // Print an emoji for each log message
          printTime: false // Should each log print contain a timestamp
          ),
      level: Level.debug,
    );
  }
}
