import 'package:example_devlane_app/src/data/data.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

/// Displays detailed information about an Open Position.
class OpenPositionDetailsView extends StatelessWidget {
  const OpenPositionDetailsView({super.key});

  static const routeName = '/sample_item';

  @override
  Widget build(BuildContext context) {

    final index = ModalRoute.of(context)!.settings.arguments as int;
    final position = openPositions[index];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Details'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              Share.share('Check out this job: ${position.url}');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
              children: [
              const Text('WE’RE HIRING', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Text('Title: ', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(position.title),
                ]
              ),
              const SizedBox(height: 8),
              Row(
                  children: [
                    const Text('Tech Stack: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    Flexible(
                        child: Text(position.stack),
                    )
                  ]
              ),
              const SizedBox(height: 8),
              const Row(
                  children: [
                    Text('Employment: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Full Time'),
                  ]
              ),
              const SizedBox(height: 8),
              Row(
                  children: [
                    const Text('Experience: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('${position.experienceYears}+ years'),
                  ]
              ),
              const SizedBox(height: 8),
              Row(
                  children: [
                    const Text('Client: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(position.client),
                  ]
              ),
              const SizedBox(height: 8),
              Row(
                  children: [
                    const Text('Industry: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(position.industry),
                  ]
              ),
              const SizedBox(height: 8),
              const Text('Welcome to Devlane!', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('''We are a dynamic software development company with a strong presence across Latin America. Currently, we specialize in offering staff augmentation services to clients worldwide, with a particular focus on North America.
Joining our team offers you the opportunity to shine and make a significant impact on the projects you work on. Many of our clients are modern small to medium-sized businesses experiencing rapid growth, and they're eager to add core members like you to their teams. This environment ensures you'll stay up-to-date with the latest technology trends.
At Devlane, our values are straightforward: we foster a collaborative environment and prioritize building long-lasting relationships where you can develop your skills as a software engineer and learn from your peers.'''),
              const SizedBox(height: 8),
              position.ableTo != null ?
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                    const Text("Here, you will be able to:", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                    const SizedBox(height: 8),
                    Text(position.ableTo ?? ""),
                    const SizedBox(height: 8),
                  ]
                ) : Container(),
              position.description != null ?
                Column(
                  children: [
                    const Text("What's the role about?", style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text(position.description ?? ""),
                    const SizedBox(height: 8),
                  ],
                ) : Container(),
              const Text("What do we require from you?", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(position.requirements),
              const SizedBox(height: 8),
              const Text("Some of our Perks", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('''✔ Salary in USD.
✔ 100% Remote
✔ 25 days of Paid Time Off per year.
✔ 8-hour workday, with flexible hours.
✔ Welcome kit from the brand.
✔ High-end hardware provided: laptop, mouse, & headphones.
✔ English classes, virtual library and online courses.
✔ Contribution bonuses

Ready to take the next step in your career? '''),
              const SizedBox(height: 8),
              const Text("Apply Now!", style: TextStyle(fontWeight: FontWeight.bold)),
            ]
          ),
        )
      ),
      persistentFooterButtons: [
        TextButton(
          onPressed: () {
            final Uri emailLaunchUri = Uri(
              scheme: 'mailto',
              path: 'contact@devlane.com',
              queryParameters: {
                'subject': 'Apply Now',
                'body': "I'd like to apply for the job of ${position.title}"
              },
            );
            launchUrl(emailLaunchUri);
          },
          style: TextButton.styleFrom(
              elevation: 2,
              backgroundColor: Colors.blue,
              minimumSize: Size(MediaQuery.of(context).size.width / 2 - 12, 0)
          ),
          child: const Text(
            'Apply Now!',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        TextButton(
          onPressed: () {
            final Uri emailLaunchUri = Uri(
              scheme: 'mailto',
              path: 'contact@devlane.com',
              queryParameters: {
                'subject': 'Refer a Friend',
                'body': "I'd like to refer a friend for the job of ${position.title}"
              },
            );
            launchUrl(emailLaunchUri);
          },
          style: TextButton.styleFrom(
              elevation: 2,
              backgroundColor: Colors.blue,
              minimumSize: Size(MediaQuery.of(context).size.width / 2 - 12, 0)
          ),
          child: const Text(
            'Refer a Friend!',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
