import 'dart:developer';
import 'package:flutter/foundation.dart';

///Logger class will only print log when mode is [debug] and show log is enable
class Logger {
  static void logPrint({isShowLog = true, required String title, String body = "", String uniquePrefix = "======>"}) {
    if (isShowLog && kDebugMode) {
      log("$uniquePrefix 📋 [${LogFindPathHelper(StackTrace.current).callerFunctionName}]");
      log('$title 👉 $body');
      log("~~~~~~~~~ [END] ~~~~~~~~~");
    }
  }
}

///====[Helper]====
///This class will help you find out caller function [name],file name, row,column number,etc.
class LogFindPathHelper {
  final StackTrace _trace;

  String? fileName;
  String? functionName;
  String? callerFunctionName;

  LogFindPathHelper(this._trace) {
    _parseTrace();
  }

  String _getFunctionNameFromFrame(String frame) {
    /* Just giving another nickname to the frame */
    var currentTrace = frame;

    /* To get rid off the #number thing, get the index of the first whitespace */
    var indexOfWhiteSpace = currentTrace.indexOf(' ');

    /* Create a substring from the first whitespace index till the end of the string */
    var subStr = currentTrace.substring(indexOfWhiteSpace);

    /* Grab the function name using reg expr */
    var indexOfFunction = subStr.indexOf(RegExp(r'[A-Za-z0-9]'));

    /* Create a new substring from the function name index till the end of string */
    subStr = subStr.substring(indexOfFunction);
    indexOfWhiteSpace = subStr.indexOf(' ');
    return subStr;
  }

  void _parseTrace() {
    /* The trace comes with multiple lines of strings, (each line is also known as a frame), so split the trace's string by lines to get all the frames */
    var frames = _trace.toString().split("\n");

    /* The first frame is the current function */
    functionName = _getFunctionNameFromFrame(frames[0]);

    /* The second frame is the caller function */
    callerFunctionName = _getFunctionNameFromFrame(frames[1]);

    /* The first frame has all the information we need */
    var traceString = frames[0];

    /* Search through the string and find the index of the file name by looking for the '.dart' regex */
    var indexOfFileName = traceString.indexOf(RegExp(r'[A-Za-z]+.dart'));

    var fileInfo = traceString.substring(indexOfFileName);

    var listOfInfos = fileInfo.split(":");

    fileName = listOfInfos.toString();
  }
}
