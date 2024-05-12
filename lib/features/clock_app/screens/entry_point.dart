import 'package:flutter/material.dart';
import 'package:flutter_micro_interactions/features/features.dart';
import 'package:flutter_svg/svg.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  List pages = [
    const ClockScreen(),
    const AlarmScreen(),
    Container(),
    Container(),
  ];

  int currentIndex = 0;
  bool active = false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: pages[currentIndex],
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: (){},
        child:  Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: UiColors.cherryRed,
              boxShadow:
              [
                BoxShadow(
                  color: Colors.red.shade600,
                  offset: const Offset(3, 3),
                  blurRadius: 5,
                  spreadRadius: 1,
                ),
                const BoxShadow(
                  color: Colors.white70,
                  offset: Offset(-5, -5),
                  blurRadius: 5,
                  spreadRadius: 1,
                ),
              ]
          ),
          child: const Icon(Icons.add, color: Colors.white,size: 25,),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar:  BottomNav(
        backgroundColor: UiColors.darkMagenta,
        leftCornerRadius: 30,
        rightCornerRadius: 30,
        shadow: const BoxShadow(
          offset: Offset(0, 1),
          blurRadius: 12,
          spreadRadius: 0.5,
          color: UiColors.darkMagenta,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...List.generate(
                navIcons.length,
                    (index) => InkWell(
                  onTap: (){
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  child: SizedBox(height: 25,
                    width: 25,
                    child: SvgPicture.asset(
                        navIcons[index].iconPath,
                        colorFilter:  ColorFilter.mode(
                          currentIndex==index?
                          UiColors.mustard: UiColors.coolViolet,
                          BlendMode.srcIn,
                        )
                    ),),
                )),
          ],
        ),
      ),
    );
  }
}

class NavIcon{
   const NavIcon({required this.iconPath});
   final String iconPath;

}

List<NavIcon> navIcons = const [
    NavIcon(
    iconPath: 'assets/images/clock.svg',
  ),
   NavIcon(
    iconPath: 'assets/images/alarm-clock.svg',
  ),
   NavIcon(
    iconPath: 'assets/images/calendar.svg',
  ),
   NavIcon(
    iconPath: 'assets/images/timer.svg',
  ),
];
