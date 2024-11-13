class Logger {
  static LogMode _logMode = LogMode.debug;

  static void init(LogMode mode) {
    Logger._logMode = mode;
  }

  static void log(dynamic data, {StackTrace? StackTrace}) {
    if(_logMode == LogMode.debug) {
      print("Error: $data$StackTrace");
    }
  }
}

enum LogMode { debug, live }