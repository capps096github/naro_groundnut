import 'package:get/get.dart';

import '../../naro_exporter.dart';

class NaroErrorScreen extends StatelessWidget {
  const NaroErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: beautify this error screen
    return Scaffold(
      appBar: AppBar(title: const Text("Page Not Found")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SelectableText("Oops! The page you are looking for does not exist."),
            TextButton(
              onPressed: () => Get.to(homePath),
              child: const Text('Go to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
