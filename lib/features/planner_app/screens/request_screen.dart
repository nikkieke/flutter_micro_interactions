import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_micro_interactions/features/features.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({Key? key, required this.animationController,}) : super(key: key);

  final AnimationController animationController;


  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {


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
                onPressed: () {

                },
                icon: const Icon(CupertinoIcons.arrow_right, color: Color(0xffededed),),
              ),
            ),
            const SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text('Requests', style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: const Color(0xffededed)),),
            ),
            const SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text('In progress', style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: const Color(0xff929292)),),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              height: 200,
              width: double.maxFinite,
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).push(createRoute());
                },
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: inProgressList.length,
                    itemBuilder: (context, index){
                      final pL = inProgressList[index];
                      ///Here the AnimationExecutor widget wraps the
                      ///RequestItemCard widget and the required parameters
                      ///are passed to trigger the animation
                      return AnimationExecutor(
                          horizontalOffset: 15,
                          verticalOffset: 0.0,
                          begin: 0,
                          end: 0.5,
                          animationController: widget.animationController,
                          isFirstPage: true,
                          child: RequestItemCard(model: pL));
                    }
                ),
              ),
            ),
            const SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text('Completed', style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: const Color(0xff929292)),),
            ),
            Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: completeList.length,
                  itemBuilder: (context, index){
                    final cL = completeList[index];
                    return AnimationExecutor(
                        horizontalOffset: 15,
                        verticalOffset: 0.0,
                        begin: 0,
                        end: 0.9,
                        animationController: widget.animationController,
                        isFirstPage: true,
                        child: RequestItemCard(model: cL));
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
