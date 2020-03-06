import 'package:path_provider/path_provider.dart';
import 'dart:io';

class FileUtils{
  static Future<String> get getFilePath async{
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<File> get getFile async {
    final path = await getFilePath;
    return File ('$path/saveFile.txt');
  }

  static Future<File> saveToFile(List<String> data) async {
    final file = await getFile;
    String dataString = data.toString();
    dataString = dataString.replaceAll(' ', '_');
    return file.writeAsString(dataString);
  }

  static Future<List<String>> readFromFile() async{
    final file = await getFile;
    String fileContents = await file.readAsString();
    List saveData = convertFile(fileContents);
    return saveData;
  }

  static List<String> convertFile(String fileText){
    fileText = fileText.replaceFirst('[', '');
    fileText = fileText.replaceFirst(']', '');
    fileText = fileText.replaceAll(' ', '');
    fileText = fileText.replaceAll('_', ' ');
    return fileText.split(',');
  }
}