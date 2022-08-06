import 'dart:ui';

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final appbarHeight = mediaQuery.padding.top;
    final bottomPadding = mediaQuery.padding.bottom;
    return Stack(
      children: [
        Image.network(imageUrl, fit: BoxFit.fitHeight, height: height),
        Material(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: appbarHeight),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        )),
                    const Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_vert_rounded,
                            color: Colors.white))
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    for (final buttonData in iconButtons) ...[
                      IconButton(
                        icon: Icon(buttonData.icon, color: Colors.white),
                        onPressed: () {},
                      ),
                      Text(
                        buttonData.amount.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                    ]
                  ],
                ),
                const Spacer(),
                const ModelDescriptionBox(),
                SizedBox(height: bottomPadding),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class ModelDescriptionBox extends StatelessWidget {
  const ModelDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    return ClipRRect(
      borderRadius: const BorderRadius.all((Radius.circular(15))),
      child: Container(
        padding: const EdgeInsets.all(15),
        width: width * 0.9,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Gal Gadot',
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Colors.white,
                    ),
              ),
              const SizedBox(height: 10),
              Text(
                decription,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.white),
                maxLines: 4,
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton.icon(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.red.shade700,
                        ),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          const RoundedRectangleBorder(
                              borderRadius: borderRadius),
                        ),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 13),
                        )),
                    label: const FilledCircleAddIcon(),
                    icon: const Text('Follow',
                        style: TextStyle(color: Colors.white)),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const borderRadius = BorderRadius.only(
  topLeft: Radius.circular(20),
  topRight: Radius.circular(20),
  bottomRight: Radius.circular(20),
);

class FilledCircleAddIcon extends StatelessWidget {
  const FilledCircleAddIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      child: Icon(Icons.add, color: Colors.black, size: 15),
    );
  }
}

class IconButtonData {
  final IconData icon;
  final int amount;

  IconButtonData({required this.icon, required this.amount});
}

final iconButtons = [
  IconButtonData(icon: Icons.comment, amount: 3),
  IconButtonData(icon: Icons.favorite, amount: 579),
  IconButtonData(icon: Icons.remove_red_eye, amount: 18),
];
const String decription =
    "Gal Gadot-Varsano is an lsraeli actress, producer, and model. At age 18, she was crowned Miss Isrel 2004, She then served two years in the Israel Defense Forces as a soldier, after whice she began";
const String imageUrl =
    "https://images.unsplash.com/photo-1615212863630-1691e4c99c15?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDF8fGNsdWJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60";
