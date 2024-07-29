import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:pixabay_gallery/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('end-to-end test', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    // Проверяем: отображается поле поиска
    expect(find.byType(TextField), findsOneWidget);

    // Ищем
    await tester.enterText(find.byType(TextField), 'nature');
    await tester.pumpAndSettle();

    // Проверяем: отображаются ли изображения
    expect(find.byType(GridView), findsOneWidget);
  });
}
