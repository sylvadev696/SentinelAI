import 'package:file_picker/file_picker.dart';

class FolderPickerService {
  static Future<String?> pickFolder() async {
    return await FilePicker.platform.getDirectoryPath(
      dialogTitle: "Select a folder to scan",
    );
  }
}