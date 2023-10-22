import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

Color greenTouch = Vx.hexToColor('#788154');

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Vx.hexToColor("#e8eddb"),
      body: SafeArea(
        child: Column(
          children: [
            // CalenderView
            const CalenderView().h(context.percentHeight *(Vx.isWeb ?33 : 27)),
            const SizedBox(
              height: 20,
            ),
            // Music Player
            const MusicPlayerView().h(context.percentHeight * 30),
            20.heightBox,
            // ChatView
            const ChatView(),
          ],
        ).p24().scrollVertical(),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        "https://media.licdn.com/dms/image/D4D03AQHAyXkZdvywjQ/profile-displayphoto-shrink_400_400/0/1677254460973?e=1703721600&v=beta&t=l0nwp8efkKmsRKIdz0RZOkHLj2CG5UD5URtZHCjXDNQ"
            .circularNetworkImage(radius: 32),
        10.widthBox,
        VStack(
          [
            const Text("VelocityX").text.bold.make(),
            const Text("Check this out!").text.caption(context).make(),
          ],
          crossAlignment: CrossAxisAlignment.start,
        ).box.p16.roundedLg.color(Vx.hexToColor('#fff6db')).make(),
      ],
    );
  }
}

class MusicPlayerView extends StatelessWidget {
  const MusicPlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    return RoundedBox(
        child: Column(
      children: [
        VxCapsule(
          backgroundColor: Vx.hexToColor('#c4ecd4'),
          width: 120,
          height: 28,
          child: [
            const Icon(
              Icons.phone_android,
            ).scale50(),
            const Text('Phone Speaker').text.xs.make(),
          ].hStack(),
        ).objectCenterRight(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VxBox()
                .square(90)
                .rounded
                .bgImage(const DecorationImage(
                    image: NetworkImage(
                        'https://lh3.googleusercontent.com/ogw/AKPQZvyByr1SCKUTAYomVwKW0kEMHGaiiTMtvHsNlbWgDg=s64-c-mo'),
                    fit: BoxFit.cover))
                .make(),
            VStack(
              [
                const Text('Song name right here.').text.semiBold.make(),
                const Text("artist name right here").text.sm.make(),
              ],
              crossAlignment: CrossAxisAlignment.start,
            ).pSymmetric(h: 16, v: 12),
          ],
        ),
        Slider(
          value: 35,
          onChanged: (value) {},
          inactiveColor: Vx.black,
          activeColor: Vx.black,
          min: 0,
          max: 100,
        ),
        HStack([
          const Text(
            '1:20',
          ).text.make(),
          const Spacer(),
          const Text('3:20').text.make(),
        ]).px(24),
        const HStack(
          [
            Icon(
              Icons.shuffle,
              size: 24,
            ),
            Spacer(),
            Icon(
              Icons.skip_previous,
              size: 24,
            ),
            Spacer(),
            Icon(
              Icons.play_arrow,
              size: 24,
            ),
            Spacer(),
            Icon(
              Icons.skip_next,
              size: 24,
            ),
            Spacer(),
            Icon(
              Icons.repeat,
              size: 24,
            ),
          ],
          alignment: MainAxisAlignment.spaceAround,
        ),
      ],
    ));
  }
}

class CalenderView extends StatelessWidget {
  const CalenderView({super.key});

  @override
  Widget build(BuildContext context) {
    return RoundedBox(
        child: Row(
      children: [
        VStack(
          [
            const Text("MAY").text.xl4.thin.tighter.make(),
            const Text("28")
                .text
                .xl6
                .size(19)
                .tightest
                .bold
                .color(Vx.hexToColor('#595236'))
                .fontFamily(GoogleFonts.poppins().fontFamily!)
                .make(),
          ],
          crossAlignment: CrossAxisAlignment.center,
        ),
        const Spacer(),
        VStack([
          VxCapsule(
            height: 30,
            width: context.percentWidth * 50,
            backgroundColor: greenTouch,
            child: const Text("Google I/o 23")
                .text
                .white
                .make()
                .px12()
                .objectCenterLeft(),
          ),
          const Spacer(),
          VStack([
            const Text('Stand Up').text.semiBold.make(),
            const Text("10:00 - 10:30 AM").text.make(),
          ])
              .box
              .border(color: greenTouch, width: 3)
              .p16
              .rounded
              .width(context.percentWidth * 50)
              .make(),
          const Spacer(),
          VxCapsule(
            backgroundColor: Vx.yellow200,
            width: context.percentWidth * 50,
            height: 30,
            child:
                const Text('Happy Hour').text.make().px12().objectCenterLeft(),
          ),
        ]),
      ],
    ));
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RoundedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              onPressed: () {},
              backgroundColor: greenTouch,
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            const GreenIcon(
              icon: Icons.mic,
            ),
            const GreenIcon(icon: Icons.bookmark_outlined),
            const GreenIcon(icon: Icons.calendar_today),
            const GreenIcon(icon: Icons.brush),
          ],
        ),
      ).p24(),
    );
  }
}

class GreenIcon extends StatelessWidget {
  const GreenIcon({super.key, required this.icon});
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: greenTouch,
    );
  }
}

class RoundedBox extends StatelessWidget {
  const RoundedBox({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return VxBox(child: child)
        .color(Vx.hexToColor('#fff6db'))
        .roundedLg
        .p24
        .make();
  }
}
