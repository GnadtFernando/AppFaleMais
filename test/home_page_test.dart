import 'package:dev_fale_mais/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Widgets test', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: HomeView(),
    ));

    final appBar = find.byType(AppBar);
    expect(appBar, findsNWidgets(1));

    final dropDown = find.byType(DropdownButtonFormField<String>);
    expect(dropDown, findsNWidgets(3));

    final formFiled = find.byType(TextFormField);
    expect(formFiled, findsNWidgets(1));

    final elevatedButton = find.byType(ElevatedButton);
    expect(elevatedButton, findsNWidgets(1));
    expect(find.widgetWithText(ElevatedButton, "Simular"), findsNWidgets(1));

    final image = find.byType(Image);
    expect(image, findsNothing);
  });
}
