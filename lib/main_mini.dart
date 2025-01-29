import 'package:flutter/cupertino.dart';
import 'package:sheet/route.dart';


void main() {
  runApp(CupertinoApp(home: Home()));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoTextField(),
            CupertinoTextField(keyboardType: TextInputType.number),
            CupertinoButton(
              child: Text('Navigator Push CupertinoPageScaffold - OK'),
              onPressed: () => showOkCupertinoSheetPage(context),
            ),
            CupertinoButton(
              child: Text('Navigator Push CupertinoPageScaffold - bad'),
              onPressed: () => showBadCupertinoSheetPage(context),
            ),
          ],
        ),
      ),
    );
  }
}


showOkCupertinoSheetPage(context) {
  Navigator.of(context).push(
    CupertinoSheetRoute(builder: (_) => Center(child: Text('Hello Sheet!'))),
  );
}

showBadCupertinoSheetPage(context) {
  Navigator.of(context).push(
    CupertinoSheetRoute(
      builder:
          (_) => CupertinoPageScaffold(
            child: ListView.builder(
              itemCount: 10000,
              itemBuilder: (_, i) => CupertinoListTile(title: Text('$i')),
            ),
          ),
    ),
  );
}
