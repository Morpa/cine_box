import 'package:cinebox/ui/core/themes/colors.dart';
import 'package:cinebox/ui/core/themes/text_styles.dart';
import 'package:cinebox/ui/movie_detail/widgets/actor_card.dart';
import 'package:flutter/material.dart';

class CastBox extends StatelessWidget {
  const CastBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: AppColors.lightGrey.withAlpha(25),
      ),
      child: ExpansionTile(
        dense: true,
        tilePadding: const EdgeInsets.only(left: 0, right: 0),
        childrenPadding: const EdgeInsets.symmetric(vertical: 10),
        title: const Text('Elenco', style: AppTextStyles.regularSmall),
        children: [
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return ActorCard(
                  imageUrl:
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/3/35/Adrien_Brody-61584.jpg/250px-Adrien_Brody-61584.jpg',
                  name: 'Actor Name',
                  character: 'Character Name',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
