import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive/rive.dart';

class MakeRequestScreen extends StatefulWidget {
  const MakeRequestScreen({Key? key}) : super(key: key);

  @override
  State<MakeRequestScreen> createState() => _MakeRequestScreenState();
}

class _MakeRequestScreenState extends State<MakeRequestScreen> {
  TextEditingController textCtr = TextEditingController();
  StateMachineController? controller;
  SMIBool? input;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff181818),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Stack(
              alignment: AlignmentDirectional.centerStart,
              children: [
                TextButton(
                    onPressed: () {},
                    child: SvgPicture.asset('assets/images/menu.svg',
                        width: 25,
                        colorFilter: const ColorFilter.mode(
                          Color(0xff929292),
                          BlendMode.srcIn,
                        ))),
                Align(
                  child: Container(
                    height: 2,
                    width: 30,
                    color: Colors.white,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: SvgPicture.asset('assets/images/user.svg',
                        width: 20,
                        colorFilter: const ColorFilter.mode(
                          Color(0xff929292),
                          BlendMode.srcIn,
                        )),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 3, color: const Color(0xff3b937e)),
                        image: const DecorationImage(
                            image: AssetImage(
                          'assets/images/avatar.png',
                        ))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Hey Josh, what can I help you with?',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 200,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: Colors.black,
                    ),
                    child: const Text(
                      '2  Requests in progress',
                      style: TextStyle(color: Color(0xff3b937e)),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: double.maxFinite,
                height: 250,
                color: const Color(0xff1f1f1f),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: textCtr,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Start typing or speaking",
                        hintStyle: TextStyle(color: Color(0xff929292)),
                      ),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                      onChanged: (value) {},
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 100,
                      width: double.maxFinite,
                      child: RiveAnimation.asset(
                        "assets/images/voice_assistant_animation.riv",
                        //fit: BoxFit.fitHeight,
                        stateMachines: const ["Login State Machine"],
                        artboard: 'compose',
                        onInit: (artboard) {
                          controller = StateMachineController.fromArtboard(
                            artboard,
                            "State Machine 1",
                          );
                          if (controller == null) return;
                          artboard.addController(controller!);
                          input = controller?.findSMI("isActive") as SMIBool;

                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
