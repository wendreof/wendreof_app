import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  var currentIndexPage = 0.0;

  final pageController = PageController(
    initialPage: 0,
    keepPage: false,
  );

  @override
  void initState() {
    super.initState();
    if (!mounted) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.purple,
        child: StatefulBuilder(builder: (context, setState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  controller: pageController,
                  onPageChanged: (position) {
                    if (mounted) {
                      setState(() => currentIndexPage = position.toDouble());
                    }
                  },
                  children: <Widget>[
                    SingleChildScrollView(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                          const SizedBox(
                            height: 20,
                          ),
                          Image.asset(
                            'assets/images/wendreo.png',
                            width: 100,
                          ),
                          const Text(
                            'Wendreo Fernandes\nSoftware Developer',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Card(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: RichText(
                                        textAlign: TextAlign.justify,
                                        text: TextSpan(
                                            text: 'About me',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary,
                                                fontWeight: FontWeight.bold),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text:
                                                      "\n\nI'm a software developer with +6 years of experience building software.",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey[800],
                                                  )),
                                              TextSpan(
                                                  text: "\n\nExpertise with:"
                                                      "\n-DevOps: Fastlane, Pipeline CI/CD, Docker, Portainer, GitHub Actions, GitLab CI, Git Hooks and deployment",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey[800],
                                                  )),
                                              TextSpan(
                                                  text:
                                                      "\n-Code Quality: Testing, SonarQube and CodeCov",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey[800],
                                                  )),
                                              TextSpan(
                                                  text:
                                                      "\n-Techs: Git, Flutter, SQL, C# (.NET Core/.NET 6.0, Web API and Worker Service) and VB.NET (.NET Framework and Windows Forms) and Scrum",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey[800],
                                                  )),
                                              TextSpan(
                                                  text:
                                                      "\n-Databases: SQL Server, Firebird, MySQL, SQLite and others",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey[800],
                                                  ))
                                            ])),
                                  ),
                                ),
                              ),
                              // Expanded(
                              //   child: Card(
                              //     child: Padding(
                              //       padding: EdgeInsets.all(8.0),
                              //       child: RichText(
                              //           textAlign: TextAlign.center,
                              //           text: TextSpan(
                              //               text: "dsadsadsad",
                              //               style: TextStyle(
                              //                   fontSize: 18,
                              //                   color: Theme.of(context)
                              //                       .accentColor,
                              //                   fontWeight: FontWeight.bold),
                              //               children: <TextSpan>[
                              //                 TextSpan(
                              //                     text: 'Pix Saque e Pix Troco',
                              //                     style: TextStyle(
                              //                         fontSize: 12,
                              //                         color: Colors.grey[800])),
                              //               ])),
                              //     ),
                              //   ),
                              //),
                            ],
                          ),
                        ])),
                    SingleChildScrollView(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const <Widget>[
                          Text("2 hahaha"),
                        ])),
                    SingleChildScrollView(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const <Widget>[
                          Text("3 hahaha"),
                        ])),
                  ],
                ),
              ),
              DotsIndicator(
                dotsCount: 3,
                position: currentIndexPage,
                decorator: DotsDecorator(
                  color: Theme.of(context).colorScheme.secondary,
                  activeColor: Theme.of(context).primaryColor,
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
      // bottomNavigationBar: Padding(
      //   padding: EdgeInsets.only(
      //       left: sizeConfig.dynamicScaleSize(size: 40),
      //       right: sizeConfig.dynamicScaleSize(size: 40),
      //       bottom: sizeConfig.dynamicScaleSize(size: 20)),
      //   child: RaisedButton(
      //     elevation: sizeConfig.dynamicScaleSize(size: 5.0),
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(30.0),
      //     ),
      //     color: Theme.of(context).primaryColor,
      //     onPressed: () async {
      //       Modular.to.pushNamed('/chave');
      //     },
      //     child: Text(
      //       'Entendi',
      //       style: TextStyle(
      //         color: Colors.white,
      //         fontSize: sizeConfig.dynamicScaleSize(size: 14),
      //         fontWeight: FontWeight.bold,
      //       ),
      //     ),
      //   ),
      // )
    );
  }
}
