import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_micro_interactions/features/features.dart';


class StaggeredAnimationScreen extends StatefulWidget {
  const StaggeredAnimationScreen({Key? key}) : super(key: key);

  @override
  State<StaggeredAnimationScreen> createState() => _StaggeredAnimationScreenState();
}

class _StaggeredAnimationScreenState extends State<StaggeredAnimationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff181818),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {  },
                icon: const Icon(CupertinoIcons.arrow_right, color: Color(0xffededed),),
              ),
            ),
            const SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text('Requests', style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: const Color(0xffededed)),),
            ),
            const SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text('In progress', style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: const Color(0xff929292)),),
            ),
            const SizedBox(height: 20,),
            const RequestItem()
          ],
        ),
      ),
    );
  }
}


