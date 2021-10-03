import 'package:flutter/material.dart';

class DetailedResultView extends StatelessWidget {
  static const dummyString =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras metus elit, egestas vel aliquet nec, rhoncus in dui. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Etiam elementum urna vel nisl bibendum suscipit";
  static const longString =
      """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus luctus magna vitae porta aliquam. Integer rhoncus sit amet tortor quis fringilla. Curabitur sed nibh sed nisi malesuada finibus eget in nisl. Suspendisse potenti. Aliquam nec nulla quis odio fringilla scelerisque. Nulla auctor felis vel rhoncus tempor. Nulla finibus, ligula id maximus posuere, quam nisl aliquet libero, nec dignissim orci nisl vel nibh.
Sed magna ligula, pellentesque sodales pharetra ac, tristique in felis. Pellentesque placerat ultrices enim, vel vulputate enim maximus ut. Vivamus sit amet tincidunt turpis. Quisque iaculis enim magna, ac ornare sem consequat quis. Curabitur pulvinar fringilla consequat. Ut sit amet suscipit turpis. In in varius dui. Pellentesque malesuada sem et justo cursus, at varius justo aliquet.""";

  const DetailedResultView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text("Prediction Result"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Card(
            margin: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                ListTile(
                  leading: Icon(Icons.info),
                  title: Text("Disease Name"),
                  subtitle: Text("Disease Probability"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(dummyString),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                  child: Text(longString),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
