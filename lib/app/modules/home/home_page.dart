import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

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
    const double circleRadius = 160.0;
    const double circleBorderWidth = 8.0;

    void launchURL(String url) async {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(
            Uri.parse(
              url,
            ),
            mode: LaunchMode.externalApplication);
      } else {
        Fluttertoast.showToast(
            msg: 'Não foi possível redirecionar.',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.grey);
      }
    }

    return Scaffold(
      body: Container(
        color: Colors.purple,
        child: StatefulBuilder(builder: (context, setState) {
          return Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 600,
                  width: 600,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: circleRadius / 2.0),
                        child: Container(
                          color: Colors.white,
                          height: 500,
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      width: circleRadius,
                                      height: circleRadius,
                                      decoration: const ShapeDecoration(
                                          shape: CircleBorder(),
                                          color: Colors.white),
                                      child: const Padding(
                                        padding:
                                            EdgeInsets.all(circleBorderWidth),
                                        child: DecoratedBox(
                                          decoration: ShapeDecoration(
                                            shape: CircleBorder(),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                'https://avatars.githubusercontent.com/u/17891980?v=4',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Text('Wendreo Fernandes',
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Text('Software Developer',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.grey[600])),
                                    const SizedBox(height: 30),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12, right: 12, bottom: 12),
                                      child: Text(
                                        "I'm a software developer with +6 years of experience building software.\n\n"
                                        "Expertise with:\n"
                                        "• DevOps: Fastlane, Pipeline CI/CD, Docker, Portainer, GitHub Actions, GitLab CI, Git Hooks and deployment;\n"
                                        "• Code Quality: Testing, SonarQube and CodeCov;\n"
                                        "• Techs: Git, Flutter, SQL, C# (.NET Core/.NET 6.0, Web API and Worker Service) and VB.NET (.NET Framework and Windows Forms) and Scrum;\n"
                                        "• Databases: SQL Server, Firebird, MySQL, SQLite and others.",
                                        style: TextStyle(
                                            fontSize: 14.5,
                                            color: Colors.grey[600]),
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconButton(
                                            icon: const FaIcon(
                                                FontAwesomeIcons.instagram),
                                            onPressed: () {
                                              launchURL(
                                                  "https://www.instagram.com/wendreof/");
                                            }),
                                        IconButton(
                                            icon: const FaIcon(
                                                FontAwesomeIcons.linkedinIn),
                                            onPressed: () {
                                              launchURL(
                                                  "https://www.linkedin.com/in/wendreof/");
                                            }),
                                        IconButton(
                                            icon: const FaIcon(
                                                FontAwesomeIcons.github),
                                            onPressed: () {
                                              launchURL(
                                                  "https://github.com/wendreof");
                                            }),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      '#csharp #dotnet #flutter #devops #cicd #sql',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.5,
                                          color: Colors.grey[500]),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
