import 'dart:math';

class ScanResult {
  final int appsScanned;
  final int filesChecked;
  final int threatsFound;
  final int protectionScore;
  final String status;

  ScanResult({
    required this.appsScanned,
    required this.filesChecked,
    required this.threatsFound,
    required this.protectionScore,
    required this.status,
  });
}

class ScanEngine {
  static ScanResult performScan() {
    final random = Random();

    final apps = 120 + random.nextInt(81); //120–200
    final files = 3000 + random.nextInt(4001); //3000–7000
    final threats = random.nextInt(4); //0–3

    int score = 100 - (threats * 15);

    if (score < 40) {
      score = 40;
    }

    String status;

    if (threats == 0) {
      status = "Your device is secure.";
    } else if (threats == 1) {
      status = "Low-risk threat detected.";
    } else if (threats == 2) {
      status = "Multiple threats detected.";
    } else {
      status = "Critical security attention required.";
    }

    return ScanResult(
      appsScanned: apps,
      filesChecked: files,
      threatsFound: threats,
      protectionScore: score,
      status: status,
    );
  }
}