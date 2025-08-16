import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinebox/ui/core/themes/colors.dart';
import 'package:cinebox/ui/core/themes/text_styles.dart';
import 'package:cinebox/ui/movie_detail/widgets/cast_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieDetailScreen extends ConsumerStatefulWidget {
  const MovieDetailScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MovieDetailScreenState();
}

class _MovieDetailScreenState extends ConsumerState<MovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do filme'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 24,
          children: [
            SizedBox(
              height: 278,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(2),
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://labdicasjornalismo.com/images/noticias/8092/28062021133620_e246crnvka.jpg',
                      placeholder: (context, url) => Container(
                        width: 160,
                        color: AppColors.lightGrey,
                        child: Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 1,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Text('Luca', style: AppTextStyles.titleLarge),
                  RatingStars(
                    starCount: 5,
                    starColor: AppColors.yellow,
                    starSize: 14,
                    valueLabelVisibility: false,
                    value: 4.9,
                  ),
                  Text(
                    'Animação, Aventura',
                    style: AppTextStyles.lightGreyRegular,
                  ),
                  Text(
                    '2021 | 1h41',
                    style: AppTextStyles.regularSmall,
                  ),
                  Text(
                    'Luca é um jovem monstro marinho que vive com sua família em uma cidade subaquática. Ele sonha em explorar o mundo acima da superfície, mas sua vida muda quando conhece Alberto, um outro monstro marinho que também deseja conhecer a terra firme. Juntos, eles embarcam em uma aventura emocionante e descobrem o valor da amizade e da coragem.',
                    style: AppTextStyles.regularSmall,
                  ),
                  const CastBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
