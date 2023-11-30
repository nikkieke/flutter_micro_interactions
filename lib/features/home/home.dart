import 'package:flutter/material.dart';
import 'package:flutter_micro_interactions/features/features.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const SideDrawer(),
    );
  }
}

class SideDrawer extends StatelessWidget {
  const SideDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: 200,
        backgroundColor: Colors.black,
        child: Container(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
                children: [
                  ListTile(
                      leading: const Icon(Icons.arrow_drop_down_circle_outlined),
                      title: const Text("Staggered Animation",style: TextStyle(
                          color: Colors.white,  fontSize: 15)),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder:(context)=> const StaggeredAnimationScreen()));
                      }
                  ),

                ]
            )
        )
    );
  }
}
