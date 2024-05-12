import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive/rive.dart';
import 'package:flutter_micro_interactions/features/features.dart';


class MakeRequestScreen extends StatefulWidget {
  const MakeRequestScreen({Key? key, required this.animationController}) : super(key: key);

  final AnimationController animationController;

  @override
  State<MakeRequestScreen> createState() => _MakeRequestScreenState();
}

class _MakeRequestScreenState extends State<MakeRequestScreen> {
  TextEditingController textCtr = TextEditingController();
  StateMachineController? controller;
  SMIBool? input;
  bool isSpeechOn = false;
  bool textSpeechDefault = true;
  bool hideButton = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    if (!_focusNode.hasFocus) {
      setState(() {
        hideButton = false;
      });
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    textCtr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff181818),
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Column(
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
                TextSpeechWidget(
                  focusNode: _focusNode,
                  isSpeechOn: isSpeechOn,
                  textCtr: textCtr,
                  riveAnimation: RiveAnimation.asset(
                    "assets/images/voice_assistant_animation.riv",
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
                  tapped: () {
                    setState(() {
                      isSpeechOn = false;
                      textSpeechDefault = false;
                      hideButton = true;
                    });
                  },
                  controller: widget.animationController,
                ),
              ],
            ),
            hideButton?
            Container():
            TextSpeechButton(
              keyboardTapped: (){
                setState(() {
                  isSpeechOn = false;
                  textSpeechDefault = false;
                });
              },
              micTapped: (){
              input?.change(true);
              Future.delayed(const Duration(seconds: 5), () {
                input!.change(false);
              });
              setState(() {
                isSpeechOn = true;
                textSpeechDefault = false;
              });
            },
              isSpeechOn: isSpeechOn,
              controller: widget.animationController,
            ),
          ],
        ),


      ),
    );
  }
}



