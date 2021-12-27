import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
   Map data={};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map;
    print(data);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
          child: Column(
            children: [
              TextButton.icon(
                onPressed: () async {
               dynamic result= await  Navigator.pushNamed(context, '/location');
               if(result != null){
                 setState(() {
                   data = {
                     'time': result['time'],
                     'location': result['location'],
                     'flag': result['flag']
                   };
                 });
               }
                },
                icon: const Icon(Icons.edit_location),
                label: const Text('Edit Location'),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['location'],
                    style: const TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Text(
                  data['time'],
                  style: const TextStyle(
                    fontSize: 66.0,
                  )
              ),

            ],
          ),
        ),
      ),
    );
  }
}
