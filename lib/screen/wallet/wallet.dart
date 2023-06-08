import 'package:evpoint/utils/imports.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: CustomAppBar(
          title: "My Wallet",
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
      ),
    );
  }
}
