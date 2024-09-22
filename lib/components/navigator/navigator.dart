import 'package:flutter/cupertino.dart';
import 'package:simple_calculator/pages/home/home.dart';
import 'package:simple_calculator/pages/product/product.dart';
import 'package:simple_calculator/pages/receipt/receipt.dart';

class NavigatorBuilder extends StatefulWidget {
  const NavigatorBuilder({super.key, this.username});
  static const title = 'Home';
  static const homeIcon = Icon(CupertinoIcons.home);
  final String? username;

  @override
  State<NavigatorBuilder> createState() => _NavigatorBuilderState();
}

class _NavigatorBuilderState extends State<NavigatorBuilder> {
  final homeKey = GlobalKey();
  final receiptKey = GlobalKey();
  final productKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            label: HomePage.title,
            icon: HomePage.homeIcon,
          ),
          BottomNavigationBarItem(
            label: ReceiptPage.title,
            icon: ReceiptPage.icon,
          ),
          BottomNavigationBarItem(
            label: ProductPage.title,
            icon: ProductPage.icon,
          ),
        ],
      ),
      tabBuilder: (context, index) {
        assert(index <= 2 && index >= 0, 'Unexpected tab index: $index');
        return switch (index) {
          0 => CupertinoTabView(
              defaultTitle: HomePage.title,
              builder: (context) => HomePage(
                key: homeKey,
              ),
            ),
          1 => CupertinoTabView(
              defaultTitle: ReceiptPage.title,
              builder: (context) => ReceiptPage(
                key: receiptKey,
              ),
            ),
          2 => CupertinoTabView(
              defaultTitle: ProductPage.title,
              builder: (context) => ProductPage(
                key: productKey,
              ),
            ),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }
}
