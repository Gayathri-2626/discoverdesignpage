import 'package:design/helpers/appcolors.dart';
import 'package:design/helpers/iconhelper.dart';
import 'package:design/models/category.dart';
import 'package:design/models/subcategory.dart';

class Utils{
  static List<Category>getMockedCategories(){
    return [
      Category(
        name: "Cam",
        imgName: "cake1",
          icon: IconFontHelper.FRUITS,
          color: AppColors.MEATS,
          subCategories: [
          SubCategory(
            name: "Music",
            imgName: "music",
            icon: IconFontHelper.FRUITS,
            color: AppColors.MEATS,
            posts: "12 posts"
          ),
          SubCategory(
            name: "Food",
            imgName: "food",
            icon: IconFontHelper.FRUITS,
            color: AppColors.MEATS,
              posts: "8 posts"

          ),
          SubCategory(
            name: "Dance",
            imgName: "dance",
            icon: IconFontHelper.FRUITS,
            color: AppColors.MEATS,
              posts: "7 posts"

          ),
          SubCategory(
            name: "Books",
            imgName: "books",
            icon: IconFontHelper.FRUITS,
            color: AppColors.MEATS,
              posts: "11 posts"

          ),
          SubCategory(
            name: "Makeover",
            imgName: "makeover",
            icon: IconFontHelper.FRUITS,
            color: AppColors.MEATS,
              posts: "10 posts"

          ),
          SubCategory(
            name: "Singing",
            imgName: "singing",
            icon: IconFontHelper.FRUITS,
            color: AppColors.MEATS,
              posts: "6 posts"

          ),
          SubCategory(
            name: "Trending",
            imgName: "trending",
            icon: IconFontHelper.FRUITS,
            color: AppColors.MEATS,
              posts: "5 posts"

          ),
          SubCategory(
            name: "politics",
            imgName: "politics",
            icon: IconFontHelper.FRUITS,
            color: AppColors.MEATS,
              posts: "12 posts"

          ),
          SubCategory(
            name: "Videos",
            imgName: "videos",
            icon: IconFontHelper.FRUITS,
            color: AppColors.MEATS,
              posts: "12 posts"

          ),
          SubCategory(
            name: "Psycology",
            imgName: "psycology",
            icon: IconFontHelper.FRUITS,
            color: AppColors.MEATS,
              posts: "12 posts"

          ),
          SubCategory(
            name: "Workouts",
            imgName: "workouts",
            icon: IconFontHelper.FRUITS,
            color: AppColors.MEATS,
              posts: "12 posts"

          ),
          SubCategory(
            name: "Nature",
            imgName: "nature",
            icon: IconFontHelper.FRUITS,
            color: AppColors.MEATS,
              posts: "12 posts"

          ),
        ]
      ),

      Category(
          name: "Cam",
          imgName: "cake2",
          icon: IconFontHelper.FRUITS,
          color: AppColors.MEATS,
          subCategories: []
      ),

      Category(
          name: "Cam",
          imgName: "cake3",
          icon: IconFontHelper.FRUITS,
          color: AppColors.MEATS,
          subCategories: []
      ),

      Category(
          name: "Cam",
          imgName: "cake4",
          icon: IconFontHelper.FRUITS,
          color: AppColors.MEATS,
          subCategories: []
      ),

      Category(
          name: "Cam",
          imgName: "fruits",
          icon: IconFontHelper.FRUITS,
          color: AppColors.MEATS,
          subCategories: []
      ),
      Category(
          name: "Cam",
          imgName: "tomato",
          icon: IconFontHelper.FRUITS,
          color: AppColors.MEATS,
          subCategories: []
      ),
    ];
  }
}