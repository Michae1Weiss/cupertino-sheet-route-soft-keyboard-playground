import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:sheet/route.dart';

GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (_, __) => CupertinoExtendedPage(child: Home()),
      routes: [
        GoRoute(
          path: 'child',
          pageBuilder: (_, __) => CupertinoSheetPage(child: Child()),
        ),
      ],
    ),
  ],
);

void main() {
  runApp(CupertinoApp.router(routerConfig: router));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('CupertinoSheetRoute Soft Keyboard Bug'),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoTextField(placeholder: 'Input #1'),
            CupertinoTextField(
              placeholder: 'Input #2',
              keyboardType: TextInputType.number,
            ),
            CupertinoTextField(onTap: () => showBadCupertinoSheetPage(context)),
            CupertinoButton(
              child: Text('Navigator Push CupertinoPageScaffold - OK'),
              onPressed: () => showOkCupertinoSheetPage(context),
            ),
            CupertinoButton(
              child: Text('Navigator Push CupertinoPageScaffold - bad'),
              onPressed: () => showBadCupertinoSheetPage(context),
            ),
            CupertinoButton(
              child: Text('Go Route Sheet Child'),
              onPressed: () => context.go('/child'),
            ),
          ],
        ),
      ),
    );
  }
}

class Child extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Column(
          children: [
            Text('Child'),
            CupertinoTextField(placeholder: 'Input #1'),
            CupertinoTextField(
              placeholder: 'Input #2',
              keyboardType: TextInputType.number,
            ),
            CupertinoTextField(
              readOnly: true,
              onTap: () => showBadCupertinoSheetPage(context),
            ),
          ],
        ),
      ),
    );
  }
}

showOkCupertinoSheetPage(context) {
  Navigator.of(context).push(
    SheetRoute(builder: (_) => Center(child: Text('Hello Sheet!'))),
  );
}

showBadCupertinoSheetPage(context) {
  Navigator.of(context).push(
    SheetRoute(
      builder:
          (_) => CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text('Sheet with ListView'),
            ),
            child: ListView.builder(
              itemCount: 10000,
              itemBuilder: (_, i) => CupertinoListTile(title: Text('$i')),
            ),
          ),
    ),
  );
}
