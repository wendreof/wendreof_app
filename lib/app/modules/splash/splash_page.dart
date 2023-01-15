import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wendreof_app/app/modules/splash/splash_store.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key? key, this.title = 'SplashPage'}) : super(key: key);
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    controller.checkConnection();

    Future.delayed(const Duration(seconds: 5), () {
      Modular.to.navigate('/home');
    });
  }

  final controller = SplashStore();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/wendreo.png',
            width: 200,
          ),
          const SizedBox(
            height: 20,
          ),
          if (mounted) ...{
            SpinKitFadingCircle(
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: index.isEven ? Colors.purple : Colors.blue,
                  ),
                );
              },
            )
          }
        ],
      ),
    );
  }
}
