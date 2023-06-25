import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  Connectivity connectivityPlus = Connectivity();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Connection"),
      ),
      body: StreamBuilder(
        stream: connectivityPlus.onConnectivityChanged,
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            ConnectivityResult result = snapShot.data!;

            switch (result) {
              case ConnectivityResult.mobile:
                return const Center(
                  child: Text("Connected with Mobile Network...!!"),
                );
              case ConnectivityResult.wifi:
                return const Center(
                  child: Text("Connected with WIFi Network...!!"),
                );
              case ConnectivityResult.none:
                return const Center(
                  child: Text("Not Connected with any Network...!!"),
                );
              default:
                return const Center(
                  child: CircularProgressIndicator(),
                );
            }
          } else if (snapShot.hasError) {
            return const Center(
              child: Text("Not Connected with any Network...!!"),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
