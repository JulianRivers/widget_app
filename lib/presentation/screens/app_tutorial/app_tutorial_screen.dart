import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
      'Busca la comida',
      'Sunt in tempor cupidatat culpa ea non cupidatat reprehenderit non. In aute dolore irure occaecat et et laboris velit in voluptate excepteur Lorem irure ex. Incididunt sunt ex sint nostrud Lorem.',
      'assets/images/1.png'),
  SlideInfo(
      'Entrega la comida',
      'Velit fugiat commodo enim in. Exercitation anim ad excepteur reprehenderit. Cupidatat aliquip consectetur ut occaecat nostrud do. Nostrud culpa eiusmod occaecat officia nostrud id ut esse ullamco officia adipisicing esse fugiat et. Adipisicing elit minim laborum officia aliquip dolor mollit culpa nostrud. Consectetur esse voluptate amet fugiat veniam irure deserunt eu. Proident aliquip nulla nulla labore sint consequat enim voluptate ipsum tempor in incididunt nisi.',
      'assets/images/2.png'),
  SlideInfo(
      'Disfruta la comida',
      'Lorem do aliquip ex nisi veniam dolore pariatur eu nulla esse nostrud. Aliquip laboris officia magna minim. Culpa proident minim consequat dolor et quis commodo esse tempor occaecat est commodo.',
      'assets/images/3.png'),
];

class AppTutorialScreen extends StatelessWidget {
  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((slideData) => _Slide(
                    title: slideData.title,
                    caption: slideData.caption,
                    imageUrl: slideData.imageUrl))
                .toList(),
          ),
          Positioned(
              right: 20,
              top: 50,
              child: TextButton(
                child: const Text('Salir'),
                onPressed: () => context.pop(),
              ))
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(image: AssetImage(imageUrl)),
              const SizedBox(
                height: 20,
              ),
              Text(
                title,
                style: titleStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                caption,
                style: captionStyle,
              )
            ]),
      ),
    );
  }
}
