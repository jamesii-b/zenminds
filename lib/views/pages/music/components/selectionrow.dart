import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zenminds/const/colors.dart';
import 'package:zenminds/providers/selection.dart';

class CategorySelectionRow extends StatefulWidget {
  const CategorySelectionRow({Key? key}) : super(key: key);

  @override
  State<CategorySelectionRow> createState() => _CategorySelectionRowState();
}

class _CategorySelectionRowState extends State<CategorySelectionRow> {
  late SelectionIndex selection; // Declare selection as late

  @override
  void initState() {
    super.initState();
    // Initialize selection inside initState
    selection = Provider.of<SelectionIndex>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 7, right: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildCategoryButton(0, 'All', 'assets/images/all.png'),
          buildCategoryButton(1, 'Meditation', 'assets/images/meditation.png'),
          buildCategoryButton(2, 'Relax', 'assets/images/sad.png'),
          buildCategoryButton(3, 'Sleep', 'assets/images/sleep.png'),
        ],
      ),
    );
  }

  Widget buildCategoryButton(int index, String label, String imagePath) {
    final isSelected =
        index == selection.selection; // Access selection.selection
    return Column(
      children: [
        FloatingActionButton(
          backgroundColor:
              isSelected ? AppColors.boxSelected : AppColors.boxColor,
          onPressed: () {
            setState(() {
              selection.updateSelection(index); // Update selection with index
            });
          },
          child: Image(
            image: AssetImage(imagePath),
            height: index == 1 ? 30 : 20,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: AppColors.boxColor,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
