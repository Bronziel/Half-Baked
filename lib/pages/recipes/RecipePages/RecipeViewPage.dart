import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../recipeLayout.dart';

class RecipeDetailsPage extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetailsPage({Key? key, required this.recipe}) : super(key: key);

  @override
  _RecipeDetailsPageState createState() => _RecipeDetailsPageState();
}

class _RecipeDetailsPageState extends State<RecipeDetailsPage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  void _showImageDialog(String imagePath) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(0),
            content: Stack(
              children: <Widget>[
                Image.network(imagePath),
                Positioned(
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Align(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.close, color: Colors.red),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.recipe.title)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.recipe.title,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Description:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                widget.recipe.description,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              CarouselSlider.builder(
                itemCount: widget.recipe.imageUrls.length,
                itemBuilder: (context, index, realIdx) {
                  return GestureDetector(
                    onTap: () =>
                        _showImageDialog(widget.recipe.imageUrls[index]),
                    child: Image.network(widget.recipe.imageUrls[index]),
                  );
                },
                options: CarouselOptions(
                  height: 400,
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
                carouselController: _controller,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.recipe.imageUrls.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _current == entry.key
                              ? Colors.purple
                              : Colors.transparent,
                          width: 2.0,
                        ),
                      ),
                      child: Image.network(entry.value, fit: BoxFit.cover),
                    ),
                  );
                }).toList(),
              ),
              Text(
                'Portion Size: ${widget.recipe.portionSize}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                'Ingredients:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              for (final ingredient in widget.recipe.ingredients)
                Text(
                  '${ingredient['name']} - ${ingredient['amount']}${ingredient['unit']}',
                ),
              const SizedBox(height: 16),
              const Text(
                'Steps:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              for (final step in widget.recipe.steps) Text(step),
              const SizedBox(height: 16),
              const Text(
                'CookingTime:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Preparation Time: ${widget.recipe.prepTime} minutes',
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                'Total Time: ${widget.recipe.totalTime} minutes',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                'Equipment:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              for (final equipmentItem in widget.recipe.equipment)
                Text(equipmentItem),
            ],
          ),
        ),
      ),
    );
  }
}
