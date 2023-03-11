import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Easy POS',
      home: Scaffold(
        appBar: AppBar(
          title: Text('The Easy POS'),
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth>600){
              double cardWidth = constraints.maxWidth / 2 - 24;
            double cardHeight = constraints.maxHeight / 2 - 24;
            return GridView.count(
              crossAxisCount: 2,
              childAspectRatio: cardWidth / cardHeight,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              children: <Widget>[
                buildTile(context, 'Sales', Icons.attach_money, Colors.green),
                buildTile(context, 'Stocks', Icons.inventory, Colors.blue),
                buildTile(context, 'Parties', Icons.group, Colors.orange),
                buildTile(context, 'Reports', Icons.receipt_long, Colors.purple),
      ],
    );
            }else{
              return GridView.count(
                crossAxisCount: 1,
                childAspectRatio: 5,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                padding: EdgeInsets.all(16.0),
                children: <Widget>[
                  buildTile(context, 'Sales', Icons.attach_money, Colors.green),
                  buildTile(context, 'Stocks', Icons.inventory, Colors.blue),
                  buildTile(context, 'Parties', Icons.group, Colors.orange),
                  buildTile(context, 'Reports', Icons.receipt_long, Colors.purple),
                ],
              );
            }
            
  },
),
      ),
    );
  }

  Widget buildTile(BuildContext context, String title, IconData icon, Color color) {
    return Card(
      
      elevation: 2.0,
      color: color,
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('You tapped the $title tile!'),
          ));
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                icon,
                size: 64.0,
                color: Colors.white,
              ),
              SizedBox(height: 16.0),
              Text(
                title,
                style: TextStyle(fontSize: 24.0, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
