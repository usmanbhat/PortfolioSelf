import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../main.dart';

class CustomDrawer extends StatelessWidget {
  final bool isDarkMode;
  final Function(bool) toggleTheme;
  //final Function(Key) scrollToSection;

  const CustomDrawer({
    super.key,
    required this.isDarkMode,
    required this.toggleTheme,
    // required this.scrollToSection,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: isDarkMode ? AppColors.customBlue1 : AppColors.customBlue3,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Drawer Header with Profile
            const DrawerHeader(
              child: CircleAvatar(
                radius: 100,
                backgroundImage: NetworkImage(
                    "https://avatars.githubusercontent.com/u/74877966"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Mohammad Usman",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                "Mobile & Web App Developer",
                style: TextStyle(
                  fontSize: 18,
                  color: isDarkMode ? Colors.white70 : Colors.black54,
                ),
              ),
            ),
            const Divider(),

            // Navigation Links
            _buildDrawerItem(
                context, 'Mohammad Usman Bhat', FontAwesomeIcons.user, () {
              //scrollToSection(key);
              Navigator.pop(context);

              // Navigate to About section
            }),
            _buildDrawerItem(
                context, 'Anantnag Kashmir', FontAwesomeIcons.addressCard, () {
              Navigator.pop(context);
              // Navigate to Experience section
            }),
            _buildDrawerItem(context, 'Student', FontAwesomeIcons.diceD6, () {
              Navigator.pop(context);
              // Navigate to Projects section
            }),

            const Divider(),

            // Theme Toggle Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Dark Mode',
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
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
            ),
            const Divider(),

            // Footer Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  '© 2024 Mohammad Usman - All Rights Reserved',
                  style: TextStyle(
                    fontSize: 14,
                    color: isDarkMode ? Colors.white70 : Colors.black54,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function for creating a drawer item
  Widget _buildDrawerItem(
      BuildContext context, String title, IconData icon, Function() onTap) {
    return ListTile(
      leading: Icon(icon, color: isDarkMode ? Colors.white : Colors.black),
      title: Text(
        title,
        style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
      ),
      onTap: () {
        Navigator.pop(context); // Close the drawer
        onTap(); // Trigger the specific navigation action
      },
    );
  }
}
