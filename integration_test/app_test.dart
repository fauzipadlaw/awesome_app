import 'package:awesome_app/core/injection/injection.dart';
import 'package:awesome_app/main.dart';
import 'package:awesome_app/presentation/screens/photo_detail_page.dart';
import 'package:awesome_app/presentation/widgets/photo_grid_view.dart';
import 'package:awesome_app/presentation/widgets/photo_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(
    () {
      configureDependencies();
    },
  );

  group('End-to-End Test', () {
    testWidgets('Test app launch and initial grid view',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      expect(find.byType(PhotoGridView), findsOneWidget);
      expect(find.byType(PhotoListView), findsNothing);
    });

    testWidgets('Test switching between grid and list view',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      var viewToggleButton = find.byIcon(Icons.list);
      await tester.tap(viewToggleButton);
      await tester.pumpAndSettle();
      viewToggleButton = find.byIcon(Icons.grid_view);

      expect(find.byType(PhotoListView), findsOneWidget);
      expect(find.byType(PhotoGridView), findsNothing);

      await tester.tap(viewToggleButton);
      await tester.pumpAndSettle();

      expect(find.byType(PhotoGridView), findsOneWidget);
      expect(find.byType(PhotoListView), findsNothing);
    });

    testWidgets('Test image loading and scrolling',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      expect(find.byType(Image), findsWidgets);

      await tester.fling(
        find.byType(GridView),
        const Offset(0, -500),
        3000,
      );
      await tester.pumpAndSettle();

      expect(find.byType(Image), findsWidgets);
    });

    testWidgets('Test navigation to detail page', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      final firstImage = find.byType(Image).first;
      await tester.tap(firstImage);
      await tester.pumpAndSettle();

      expect(find.byType(PhotoDetailPage), findsOneWidget);
    });

    testWidgets('Test pull to refresh functionality',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      await tester.fling(
        find.byType(GridView),
        const Offset(0, 300),
        1000,
      );
      await tester.pumpAndSettle();

      expect(find.byType(RefreshIndicator), findsOneWidget);
    });
  });
}
