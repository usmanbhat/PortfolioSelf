import 'dart:convert';
import 'package:app/widgets/footer.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app/widgets/drawer.dart';
import 'package:url_launcher/url_launcher_string.dart';

void main() {
  runApp(const PortfolioApp());
}

// Theme colors
class AppColors {
  static const Color customBlue1 = Color(0xFF0C2037); // Darkest Blue
  static const Color customBlue2 = Color(0xFF1E4577); // Medium Dark Blue
  static const Color customBlue3 = Color(0xFF46A5DD); // Light Blue
  static const Color customBlue4 = Color(0xFFB8D8EF); // Lightest Blue
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: const PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PortfolioPageState createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  bool isDarkMode = false;

  void toggleTheme(bool value) {
    setState(() {
      isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Scaffold(
      backgroundColor:
          isDarkMode ? AppColors.customBlue2 : AppColors.customBlue4,
      appBar: isMobile
          ? AppBar(
              backgroundColor:
                  isDarkMode ? AppColors.customBlue1 : AppColors.customBlue3,
              // title: const Text("Portfolio"),
              title: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.terminal, // Terminal icon
                    color: isDarkMode
                        ? Colors.white
                        : Colors.black, // Icon color based on theme
                  ),
                  const SizedBox(width: 8), // Space between the icon and text
                  Text(
                    "Portfolio",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isDarkMode
                          ? Colors.white
                          : Colors.black, // Text color based on theme
                    ),
                  ),
                ],
              ),

              // actions: [
              //   AnimatedToggleSwitch.dual(
              //     // onTap: toggleTheme,
              //     current: isDarkMode,
              //     onChanged: toggleTheme,
              //     first: false,
              //     second: true,
              //     spacing: 8,
              //     height: 36,
              //     indicatorSize: Size.square(32),
              //     animationCurve: Curves.decelerate,
              //     style: ToggleStyle(
              //       backgroundColor:
              //           isDarkMode ? Colors.blue[500] : Colors.blue[100],
              //       borderColor: Colors.transparent,
              //     ),
              //     styleBuilder: (_) => ToggleStyle(
              //         indicatorColor: isDarkMode ? Colors.white : Colors.black),
              //     iconBuilder: (isDarkMode) {
              //       if (isDarkMode) {
              //         return Icon(Icons.wb_sunny_outlined);
              //       } else {
              //         return Icon(Icons.mode_night_outlined);
              //       }
              //     },
              //     textBuilder: (isDarkMode) {
              //       if (isDarkMode) {
              //         return Icon(FontAwesomeIcons.moon);
              //       } else {
              //         return Icon(FontAwesomeIcons.sun);
              //       }
              //     },
              //   ),
              // ],
            )
          : //app bar for tab and laptop

          AppBar(
              backgroundColor:
                  isDarkMode ? AppColors.customBlue1 : AppColors.customBlue3,
              // title: const Text("Portfolio"),
              title: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.terminal, // Terminal icon
                    color: isDarkMode
                        ? Colors.white
                        : Colors.black, // Icon color based on theme
                  ),
                  const SizedBox(width: 8), // Space between the icon and text
                  Text(
                    "Portfolio",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isDarkMode
                          ? Colors.white
                          : Colors.black, // Text color based on theme
                    ),
                  ),
                ],
              ),

              actions: [
                AnimatedToggleSwitch.dual(
                  current: isDarkMode,
                  onChanged: toggleTheme,
                  first: false,
                  second: true,
                  spacing: 8,
                  height: 36,
                  indicatorSize: const Size.square(32),
                  animationCurve: Curves.decelerate,
                  style: ToggleStyle(
                    backgroundColor: isDarkMode
                        ? AppColors.customBlue2
                        : AppColors.customBlue4,
                    borderColor: Colors.transparent,
                  ),
                  styleBuilder: (_) => ToggleStyle(
                      indicatorColor:
                          isDarkMode ? Colors.white : Colors.grey[700]),
                  iconBuilder: (isDarkMode) {
                    if (isDarkMode) {
                      return const Icon(
                        Icons.mode_night_outlined,
                        color: Colors.black,
                      );
                    } else {
                      return const Icon(
                        Icons.wb_sunny_outlined,
                        color: Colors.white,
                      );
                    }
                  },
                  textBuilder: (isDarkMode) {
                    if (isDarkMode) {
                      return const Icon(Icons.wb_sunny_outlined);
                    } else {
                      return const Icon(
                        FontAwesomeIcons.moon,
                        color: Colors.black,
                      );
                    }
                  },
                ),
              ],
            ),
      endDrawer: CustomDrawer(
        isDarkMode: isDarkMode,
        toggleTheme: toggleTheme,
        //scrollToSection: _scrollToSection(Key  sectionkey),
      ),
      body: Row(
        children: [
          if (!isMobile)
            const Padding(
              padding: EdgeInsets.only(bottom: 10.0),
            ),
          // NavigationRail(
          //   backgroundColor:
          //       isDarkMode ? AppColors.customBlue1 : AppColors.customBlue3,
          //   selectedIndex: 0,
          //   onDestinationSelected: (index) {},
          //   destinations: const [
          //     NavigationRailDestination(
          //       icon: Icon(FontAwesomeIcons.person,
          //           color: AppColors.customBlue3),
          //       label: Text("About"),
          //     ),
          //     NavigationRailDestination(
          //       icon: Icon(Icons.work),
          //       label: Text("Experience"),
          //     ),
          //     NavigationRailDestination(
          //       icon: Icon(FontAwesomeIcons.code),
          //       label: Text("Projects"),
          //     ),
          //   ],
          // ),
          Expanded(
            child: isMobile
                ? SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // Align content to the left
                      children: [
                        // Static Section
                        _buildStaticSection(),
                        Container(
                          key: GlobalKey(),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                bottom: 10.0), // Space below the title
                            child: Text(
                              "About",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: isDarkMode ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                              20, 0, 0, 40), // Space below the title
                          child: Text(
                            "I’m Usman Bhat, a professional passionate about creating innovative, user-focused solutions. My work blends creativity with technical precision, turning ideas into functional, elegant projects. Let’s collaborate to build something exceptional!",
                            style: TextStyle(
                              fontSize: 18,
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                        // Title for Experience and Projects
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 16.0), // Space below the title
                          child: Text(
                            "Projects",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                        // Experience Section
                        _buildProjectsSection(),
                        // Add space between Experience and Projects sections
                        const SizedBox(height: 24),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 16.0), // Space below the title
                          child: Text(
                            "Experience",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                        // Projects Section
                        _buildExperienceSection(),

                        Footer(isDarkMode: isDarkMode),
                      ],
                    ),
                  )
                : Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: _buildStaticSection(),
                      ),
                      Flexible(
                        flex: 2,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment
                                .start, // Align text to the left
                            children: [
                              // Add title for the Experience and Projects sections
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 16.0), // Space below the title
                                child: Text(
                                  "Projects and Experience",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: isDarkMode
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              // Experience Section
                              // Add space between Experience and Projects sections
                              const SizedBox(height: 24),
                              // Projects Section
                              _buildProjectsSection(),
                              const SizedBox(height: 24),

                              _buildExperienceSection(),

                              Footer(isDarkMode: isDarkMode),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
      //bottomNavigationBar: Footer(isDarkMode: isDarkMode),
    );
  }

  Widget _buildStaticSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Mohammad Usman",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          Text(
            "Mobile & Web App Developer",
            style: TextStyle(
              fontSize: 20,
              color: isDarkMode ? Colors.white70 : Colors.black87,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () async {
              const url =
                  'https://drive.google.com/file/d/1DNnsV-alIccIAZfbBQFbShoWd3rV3VoP/view?usp=drivesdk'; // Replace with your LinkedIn URL
              if (await canLaunchUrlString(url)) {
                await launchUrlString(url); // Open LinkedIn URL
              } else {
                // Handle the error, in case the URL can't be opened
                throw 'Could not launch $url';
              }

              // Open LinkedIn link (replace with actual URL)
            },
            icon: const Icon(FontAwesomeIcons.filePdf),
            label: Text(
              "Resume",
              style: TextStyle(
                fontSize: 20,
                color: isDarkMode ? Colors.white : Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 16), // Space between Resume and social icons
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(
                  FontAwesomeIcons.github, // Placeholder for Twitter icon
                  color: isDarkMode ? Colors.white70 : Colors.grey[700],
                ),
                onPressed: () async {
                  const url =
                      'https://github.com/usman-bhat/'; // Replace with your LinkedIn URL
                  if (await canLaunchUrlString(url)) {
                    await launchUrlString(url); // Open LinkedIn URL
                  } else {
                    // Handle the error, in case the URL can't be opened
                    throw 'Could not launch $url';
                  }

                  // Open LinkedIn link (replace with actual URL)
                },
              ),
              const SizedBox(width: 16), // Space between icons
              IconButton(
                icon: Icon(
                  FontAwesomeIcons.xTwitter, // Placeholder for GitHub icon
                  color: isDarkMode ? Colors.white70 : Colors.grey[700],
                ),
                onPressed: () async {
                  const url =
                      'https://www.twitter.com/m_usmanbhat'; // Replace with your LinkedIn URL
                  if (await canLaunchUrlString(url)) {
                    await launchUrlString(url); // Open LinkedIn URL
                  } else {
                    // Handle the error, in case the URL can't be opened
                    throw 'Could not launch $url';
                  }

                  // Open LinkedIn link (replace with actual URL)
                },
              ),
              const SizedBox(width: 16),
              IconButton(
                icon: Icon(
                  FontAwesomeIcons.linkedin, // Placeholder for LinkedIn icon
                  color: isDarkMode ? Colors.white70 : Colors.grey[700],
                ),
                onPressed: () async {
                  const url =
                      'https://www.linkedin.com/in/mohammad-usman-bhat-75779716b'; // Replace with your LinkedIn URL
                  if (await canLaunchUrlString(url)) {
                    await launchUrlString(url); // Open LinkedIn URL
                  } else {
                    // Handle the error, in case the URL can't be opened
                    throw 'Could not launch $url';
                  }

                  // Open LinkedIn link (replace with actual URL)
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceSection() {
    return FutureBuilder(
      future:
          DefaultAssetBundle.of(context).loadString("assets/experience.json"),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final List<dynamic> experienceData = snapshot.data != null
              ? List.from(jsonDecode(snapshot.data as String))
              : [];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: experienceData.map((exp) {
              return _buildExperienceCard(
                title: exp['title'],
                company: exp['company'],
                year: exp['year'],
                description: exp['description'],
                skills: List<String>.from(exp['skills']),
              );
            }).toList(),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _buildExperienceCard({
    required String title,
    required String company,
    required String year,
    required String description,
    required List<String> skills,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.grey[200] : Colors.grey[800],
            ),
          ),
          Text(
            "$company · $year",
            style: TextStyle(
              fontSize: 14,
              color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              color: isDarkMode ? Colors.grey[300] : Colors.grey[700],
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: skills
                .map(
                  (skill) => Chip(
                    label: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _getSkillIcon(skill),
                        const SizedBox(width: 8),
                        Text(
                          skill,
                          style: TextStyle(
                              color:
                                  isDarkMode ? Colors.white : Colors.grey[900]),
                        ),
                      ],
                    ),
                    backgroundColor: isDarkMode
                        ? AppColors.customBlue1
                        : AppColors.customBlue3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    side: BorderSide.none,
                    elevation: 0,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _getSkillIcon(String skill) {
    switch (skill.toLowerCase()) {
      case 'flutter':
        return const Icon(
          FontAwesomeIcons.flutter,
          size: 18,
        );
      case 'python':
        return const Icon(FontAwesomeIcons.python, size: 18);
      case 'dart':
        return const Icon(FontAwesomeIcons.dartLang, size: 18);
      case 'nodejs':
        return const Icon(FontAwesomeIcons.nodeJs, size: 18);
      case 'android':
        return const Icon(FontAwesomeIcons.android, size: 18);
      case 'java':
        return const Icon(FontAwesomeIcons.java, size: 18);
      case 'react':
        return const Icon(FontAwesomeIcons.react, size: 18);
      case 'nextjs':
        return const Icon(FontAwesomeIcons.js, size: 18);
      case 'css':
        return const Icon(FontAwesomeIcons.css3, size: 18);
      case 'aws':
        return const Icon(FontAwesomeIcons.aws, size: 18);
      case 'github':
        return const Icon(FontAwesomeIcons.github, size: 18);
      case 'html':
        return const Icon(FontAwesomeIcons.html5, size: 18);
      case 'firebase':
        return const Icon(FontAwesomeIcons.fireBurner, size: 18);

      case 'sql':
        return const Icon(FontAwesomeIcons.database, size: 18);
      default:
        return const Icon(Icons.code, size: 18);
    }
  }

  Widget _buildProjectsSection() {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString("assets/projects.json"),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          final List<dynamic> projectData = snapshot.data != null
              ? List.from(jsonDecode(snapshot.data as String))
              : [];
          double screenwth = MediaQuery.of(context).size.width;
          double imagewidth = screenwth < 600 ? screenwth : 600;

          return SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true, // Use shrinkWrap to fit content size
                  physics:
                      const NeverScrollableScrollPhysics(), // Prevent scrolling inside the ListView
                  itemCount: projectData.length,
                  itemBuilder: (context, index) {
                    final project = projectData[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: isDarkMode
                                    ? Colors.grey[700]!
                                    : Colors.grey[700]!,
                                width: 5.0,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                project['image'],
                                fit: BoxFit.cover,
                                height: 200,
                                width: imagewidth,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      project['title'],
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: isDarkMode
                                            ? Colors.grey[200]
                                            : Colors.grey[800],
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () async {
                                        final url = project['url'];
                                        if (await canLaunchUrlString(url)) {
                                          await launchUrlString(url);
                                        } else {
                                          throw 'Could not launch $url';
                                        }
                                      },
                                      icon: Icon(
                                        FontAwesomeIcons.arrowUpRightFromSquare,
                                        color: isDarkMode
                                            ? Colors.grey[200]
                                            : Colors.grey[700],
                                        size: 15,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  project['description'],
                                  style: TextStyle(
                                    color: isDarkMode
                                        ? Colors.grey[300]
                                        : Colors.grey[700],
                                  ),
                                ),
                                Wrap(
                                  spacing: 8,
                                  children:
                                      List<String>.from(project['technologies'])
                                          .map(
                                            (skill) => Chip(
                                              label: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  _getSkillIcon(skill),
                                                  const SizedBox(width: 8),
                                                  Text(
                                                    skill,
                                                    style: TextStyle(
                                                      color: isDarkMode
                                                          ? Colors.white
                                                          : Colors.grey[900],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              backgroundColor: isDarkMode
                                                  ? Colors.blueAccent
                                                  : Colors.lightBlue,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                              side: BorderSide.none,
                                              elevation: 0,
                                            ),
                                          )
                                          .toList(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        }
      },
    );
  }
  // Widget _buildProjectsSection() {
  //   return FutureBuilder(
  //     future: DefaultAssetBundle.of(context).loadString("assets/projects.json"),
  //     builder: (context, snapshot) {
  //       if (snapshot.connectionState == ConnectionState.done) {
  //         final List<dynamic> projectData = snapshot.data != null
  //             ? List.from(jsonDecode(snapshot.data as String))
  //             : [];
  //         return GridView.builder(
  //           shrinkWrap: true,
  //           physics: const NeverScrollableScrollPhysics(),
  //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //             crossAxisCount: 1, // One card per row
  //             crossAxisSpacing: 16,
  //             mainAxisSpacing: 8,
  //           ),
  //           itemCount: projectData.length,
  //           itemBuilder: (context, index) {
  //             final project = projectData[index];
  //             return Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: Column(
  //                 children: [
  //                   Expanded(
  //                     //padding: const EdgeInsets.symmetric(horizontal: 8.0), // Add padding for left and right
  //                     child: Container(
  //                       decoration: BoxDecoration(
  //                         border: Border.all(
  //                           color: isDarkMode
  //                               ? Colors.grey[700]!
  //                               : Colors.grey[700]!, // Border color
  //                           width: 5.0, // Border width
  //                         ),
  //                         borderRadius: BorderRadius.circular(
  //                             8), // Match the ClipRRect radius
  //                       ),
  //                       child: ClipRRect(
  //                         borderRadius: BorderRadius.circular(8),
  //                         child: Image.asset(
  //                           project['image'],
  //                           fit: BoxFit.fill,
  //                           height: 200, // Fixed height
  //                           width: double.infinity,
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                   Padding(
  //                     padding: const EdgeInsets.all(8.0),
  //                     child: Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         Text(
  //                           project['title'],
  //                           style: TextStyle(
  //                             fontSize: 20,
  //                             fontWeight: FontWeight.bold,
  //                             color: isDarkMode
  //                                 ? Colors.grey[200]
  //                                 : Colors.grey[800],
  //                           ),
  //                         ),
  //                         const SizedBox(
  //                           width: 8,
  //                         ),
  //                         IconButton(
  //                             onPressed: () async {
  //                               final url = project[
  //                                   'url']; // Replace with your LinkedIn URL
  //                               if (await canLaunchUrlString(url)) {
  //                                 await launchUrlString(
  //                                     url); // Open LinkedIn URL
  //                               } else {
  //                                 // Handle the error, in case the URL can't be opened
  //                                 throw 'Could not launch $url';
  //                               }

  //                               // Open LinkedIn link (replace with actual URL)
  //                             },
  //                             icon: Icon(
  //                               FontAwesomeIcons.arrowUpRightFromSquare,
  //                               color: isDarkMode
  //                                   ? Colors.grey[200]
  //                                   : Colors.grey[700],
  //                               size: 20,
  //                             )),
  //                         const SizedBox(height: 8),
  //                         Text(
  //                           project['description'],
  //                           style: TextStyle(
  //                             color: isDarkMode
  //                                 ? Colors.grey[300]
  //                                 : Colors.grey[700],
  //                           ),
  //                         ),
  //                         const SizedBox(height: 8),
  //                         Wrap(
  //                           spacing: 8,
  //                           children: List<String>.from(project['technologies'])
  //                               .map(
  //                                 (skill) => Chip(
  //                                   label: Row(
  //                                     mainAxisSize: MainAxisSize.min,
  //                                     children: [
  //                                       _getSkillIcon(skill),
  //                                       const SizedBox(width: 8),
  //                                       Text(
  //                                         skill,
  //                                         style: TextStyle(
  //                                             color: isDarkMode
  //                                                 ? Colors.white
  //                                                 : Colors.grey[900]),
  //                                       ),
  //                                     ],
  //                                   ),
  //                                   backgroundColor: isDarkMode
  //                                       ? AppColors.customBlue1
  //                                       : AppColors.customBlue3,
  //                                   shape: RoundedRectangleBorder(
  //                                       borderRadius:
  //                                           BorderRadius.circular(16)),
  //                                   side: BorderSide.none,
  //                                   elevation: 0,
  //                                 ),
  //                               )
  //                               .toList(),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             );
  //           },
  //         );
  //       } else {
  //         return const Center(child: CircularProgressIndicator());
  //       }
  //     },
  //   );
  // }
}
