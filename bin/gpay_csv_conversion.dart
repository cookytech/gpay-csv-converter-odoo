import 'dart:io';
import 'package:intl/intl.dart';


void main(List<String> args) async {
  final inputFile = 'csvs/input.csv'; // Update this path
  final outputFile = 'csvs/output.csv'; // Update this path

  final input = File(inputFile).readAsLinesSync();
  final output = File(outputFile).openWrite();

  input.forEach((String e) {
    List<String> listOfValues = e.split(',');
    final creationTimeIndex = 3;
    final updationTimeIndex = 9;
    final creationTime = DateTime.tryParse(listOfValues[creationTimeIndex]);
    final updationTime = DateTime.tryParse(listOfValues[updationTimeIndex]);
    if (creationTime != null && updationTime != null) {
      final creationTimeString = DateFormat('yyyy-MM-dd').format(creationTime);
      listOfValues[creationTimeIndex] = creationTimeString;
      final updationTimeString = DateFormat('yyyy-MM-dd').format(updationTime);
      listOfValues[updationTimeIndex] = updationTimeString;
    }
    output.writeln(listOfValues.join(','));
    print("object");
  });

  output.close();
}
