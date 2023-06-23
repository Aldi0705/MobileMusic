import 'package:flutter/material.dart';

class Premium extends StatefulWidget {
  @override
  _premium createState() => _premium();
}

class _premium extends State<Premium> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Premium Subscription'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              PremiumCard(
                title: 'Paket Gercepp',
                price: 'Rp.29.000/1 Bulan',
                features: [
                  'Ad-free streaming',
                  'Offline listening',
                  'High-quality audio',
                  'Unlimited skips',
                  'Lyrics display',
                ],
                buttonText: 'SUBSCRIBE',
                buttonColor: Colors.purple,
              ),
              SizedBox(height: 16.0),
              PremiumCard(
                title: 'Paket Santuyy',
                price: 'Rp.79.000/3 Bulan',
                features: [
                  'Ad-free streaming',
                  'Offline listening',
                  'High-quality audio',
                  'Unlimited skips',
                  'Lyrics display',
                ],
                buttonText: 'SUBSCRIBE',
                buttonColor: Colors.purple,
              ),
              SizedBox(height: 16.0),
              PremiumCard(
                title: 'Paket Sultann',
                price: 'Rp.159.000/1 Tahun',
                features: [
                  'Ad-free streaming',
                  'Offline listening',
                  'High-quality audio',
                  'Unlimited skips',
                  'Lyrics display',
                ],
                buttonText: 'SUBSCRIBE',
                buttonColor: Colors.purple,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PremiumCard extends StatelessWidget {
  final String title;
  final String price;
  final List<String> features;
  final String buttonText;
  final Color buttonColor;

  const PremiumCard({
    required this.title,
    required this.price,
    required this.features,
    required this.buttonText,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.0),
            Text(
              price,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: features.map((feature) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.check, size: 16.0),
                      SizedBox(width: 8.0),
                      Text(feature),
                    ],
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {},
              child: Text(buttonText),
              style: ElevatedButton.styleFrom(
                primary: buttonColor,
                onPrimary: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
