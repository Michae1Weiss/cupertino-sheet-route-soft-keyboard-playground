import 'package:flutter/cupertino.dart';
import 'package:sheet/route.dart';
import 'package:sheet/sheet.dart';


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
              onPressed: () => showOkCupertinoSheetPage(context),// This works ok
            ),
            CupertinoButton(
              child: Text('Navigator Push CupertinoPageScaffold - bad'), 
              onPressed: () => showBadCupertinoSheetPage(context),// When soft keyboard on Android or iOS is open - the Sheet tries to go up but go down instantly and we see darked background. 
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
            //resizeToAvoidBottomInset: false,
            // child: CupertinoFormSection(children: List.generate(1000, (i) => CupertinoListTile(title: Text('$i')))),  // This works fine
            child: ListView.builder(  // With ListView the Sheet doesn't appear
              itemCount: 10000,
              itemBuilder: (_, i) => CupertinoListTile(title: Text('$i')),
            ),
          ),
    ),
  );
}
