import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'Take the Smart Lane to scale your team with LatAm devs.',
            style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
              'Worry about goals, not hires. Partner with staff augmentation experts that provide you the right fit for your company, without the hassle of traditional nearshoring or freelancers.'),
          const SizedBox(height: 8),
          const Text(
            'Thriving with Companies Who Choose Us',
            style: TextStyle(
                color: Colors.blueAccent, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
              'We are the preferred choice of the most forward-thinking companies for building and managing their nearshore development teams.'),
          const SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  launchUrlString('https://clutch.co/profile/devlane');
                },
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/images/clutch_logo.svg',
                      width: 42,
                      height: 42,
                      colorFilter:
                          const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                      semanticsLabel: 'Clutch',
                    ),
                    const SizedBox(height: 8),
                    SvgPicture.asset(
                      'assets/images/ratings_logo.svg',
                      width: 12,
                      height: 12,
                      colorFilter:
                          const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                      semanticsLabel: 'Ratings',
                    ),
                    const Text('CLUTCH'),
                    const Text('5.0')
                  ],
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  launchUrlString('https://clutch.co/it-services/staff-augmentation');
                },
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/images/globe_logo.svg',
                      width: 42,
                      height: 42,
                      colorFilter:
                          const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                      semanticsLabel: 'Globe',
                    ),
                    const SizedBox(height: 8),
                    const Text('WORLD TOP 5'),
                    const Text('Staff augmentation'),
                    const Text('companies')
                  ],
                ),
              ),
            ),
          ]),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    launchUrlString(
                        'https://clutch.co/it-services/staff-augmentation?geona_id=40819');
                  },
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/images/latam_logo.svg',
                        width: 42,
                        height: 42,
                        colorFilter: const ColorFilter.mode(
                            Colors.black, BlendMode.srcIn),
                        semanticsLabel: 'Globe',
                      ),
                      const SizedBox(height: 8),
                      const Text('Latam TOP 3'),
                      const Text('Staff augmentation'),
                      const Text('companies')
                    ],
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    launchUrlString(
                        'https://clutch.co/press-releases/Clutch-100-fastest-growing-companies-2023');
                  },
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/images/trophy_logo.svg',
                        width: 42,
                        height: 42,
                        colorFilter: const ColorFilter.mode(
                            Colors.black, BlendMode.srcIn),
                        semanticsLabel: 'Trophy',
                      ),
                      const SizedBox(height: 8),
                      const Text('2023 TOP 15'),
                      const Text('Fastest-Growing'),
                      const Text('companies')
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {
              final Uri emailLaunchUri = Uri(
                scheme: 'mailto',
                path: 'contact@devlane.com',
                queryParameters: {
                  'subject': 'Contact Us',
                  'body': "Let's start our partnership | Outsourcing in LatAm"
                },
              );
              launchUrl(emailLaunchUri);
            },
            style: TextButton.styleFrom(
                elevation: 2, backgroundColor: Colors.blue),
            child: const Text(
              'Contact us',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
