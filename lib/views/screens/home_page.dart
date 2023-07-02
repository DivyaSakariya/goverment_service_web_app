import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<Map> allGovernmentData = [
    {
      'title': 'National Government Services',
      'url': 'https://services.india.gov.in/',
    },
    {
      'title': 'National Single Window System',
      'url': 'https://www.nsws.gov.in/',
    },
    {
      'title': 'Startup India Seed Fund Scheme(SISFS)',
      'url': 'https://seedfund.startupindia.gov.in/',
    },
    {
      'title': 'Pradhan Mantri Ujjwala Yojana 2.0',
      'url': 'https://www.pmuy.gov.in/ujjwala2.html',
    },
    {
      'title': 'Pharmaceuticals & Medical Devices Bureau Of India (PMBI)',
      'url': 'https://www.pmuy.gov.in/ujjwala2.html',
    },
    {
      'title': 'Ministry Of Road Transport & Highways',
      'url':
          'https://parivahan.gov.in/parivahan/en/content/launched-m-parivahan-mobile-app',
    },
    {
      'title': 'RTE',
      'url': 'https://rte.orpgujarat.com/',
    },
    {
      'title': 'Attendance Dashboard',
      'url': 'https://attendance.gov.in/',
    },
    {
      'title': 'Online Attendance For Schools',
      'url': 'https://schoolattendancegujarat.in/',
    },
    {
      'title': 'Samagra Shiksha',
      'url': 'https://www.ssagujarat.org/',
    },
    {
      'title': 'National Career Service',
      'url': 'https://www.ncs.gov.in/',
    },
    {
      'title': 'Department Of Telecommunication',
      'url': 'https://dot.gov.in/national-government-services-portal',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Government Services App"),
      ),
      body: ListView.builder(
        itemCount: allGovernmentData.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('web_page',
                      arguments: allGovernmentData[index]);
                },
                child: Card(
                  child: ListTile(
                    leading: Text("${index + 1}"),
                    title: Text("${allGovernmentData[index]['title']}"),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
